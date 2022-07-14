export 'package:get/get.dart';
export 'holedoapi/holedoapi.dart';
export 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:holedo/main.dart';
export 'package:provider/provider.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/models/holedoapi/menu_item.dart';
import 'package:holedo/services/holedo_api_services.dart';

class AppState extends ChangeNotifier {
  AppState({String? username, User? profile})
      : _username = username,
        _profile = profile;

  bool get isLoggedIn => _username != null;

  String? _username;
  String? _token;
  User? _profile;
  String? get username => _username;

  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  String? get token => _token;
  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  bool isLoginnedAndEditable(User data) {
    print('p: ${profile?.slug} ${data.slug}');
    if (profile?.slug != null) {
      if (data.slug == profile?.slug) {
        return true;
      }
    }

    return false;
  }

  User? get profile => _profile;
  set profile(User? data) {
    _profile = data;
    _username = data?.fullName;
    notifyListeners();
  }

  final List<User> _profiles = [];
  Iterable<User> get profiles => List.unmodifiable(_profiles);

  void addProfile(User data) {
    _profiles.add(data);
    notifyListeners();
  }

  Future<DataModel> saveProfile(context, User data) async {
    data.id = _profile?.id;
    // ignore: unused_local_variable

    data.slug = _profile?.slug;
    //this.token = profile.token;
    var dataModel =
        await Get.put(HoledoDatabase().users).saveProfile(context, data);
    _profile = dataModel.user as User;
    return dataModel;
  }

  NewsController get news => Get.put(NewsController());
}

class HoledoDatabase extends GetxController {
  var isLoading = true.obs;
  final apiHost = 'api.holedo.com';
  final apiKey = 'Holedo_flutter_tests';
  final token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM2MDgsImV4cCI6MTk2NzU1MDk5MH0.TTXGrAWbFkpMgjzzh2kly0RqyLxc_NzPIlyr7nzvc_I';
  final box = GetStorage();
  DataModel? settingsList;
  List<ArticleCategory> articleCategories = [];
  List<Article> articles = [];
  List<PageContent> pages = [];
  List<Company> companies = [];
  final List<String> articlePaths = [];
  final ApiServices _api = ApiServices();
  late AppState appState;
  late BuildContext context;
  final List<MenuNavItem> menuItems = [
    MenuNavItem(
      title: 'Home',
      path: '/home',
      inNav: true,
      inDrawer: true,
    ),

    MenuNavItem(
      title: 'Profile',
      path: '/profile',
      inNav: true,
      inDrawer: true,
    ),
    MenuNavItem(
      title: 'News',
      path: '/news',
      inNav: true,
      inDrawer: true,
    ),
    MenuNavItem(
      title: 'Jobs',
      path: '/jobs',
      inNav: true,
      inDrawer: true,
    ),
    MenuNavItem(
      title: 'Recruitments',
      path: '/recruitments',
      inNav: true,
      inDrawer: true,
    ),
    MenuNavItem(
      title: 'Help',
      path: '/help',
      inNav: true,
      inDrawer: true,
    ),
    // MenuNavItem(
    //   title: 'Logout',
    //   path: '/logout',
    //   inNav: false,
    //   inDrawer: true,
    //   loginOnly: true,
    // ),
    // MenuNavItem(
    //   title: 'Login',
    //   path: '/login',
    //   inNav: false,
    //   inDrawer: true,
    //   loginOnly: false,
    // ),
  ];

  void snackBarMessage(BuildContext context, type, message) {
    var label = 'Info';
    var color = Colors.blue;

    switch (type) {
      case 'error':
        label = 'Error';
        color = Colors.red;
        break;
      case 'info':
        label = 'Info';
        color = Colors.blue;
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label: $message'),
        backgroundColor: color,
        elevation: 10,
      ),
    );
  }

  void getArticleCategories() async {
    articleCategories = getModel().articleCategories as List<ArticleCategory>;
  }

  final NewsController news = NewsController();
  final UsersController users = UsersController();
  final JobsController jobs = JobsController();

  Future<void> init() async {
    await GetStorage.init();
    //this.resetModel();
    print('starting website... ');

    await this.fetchSettings();
    final model = getModel();
    if (model.token != null || model.user?.fullName != null) {
      print(
          'cached user: ${model.user?.id} ${model.user?.fullName} ${model.user?.token}');
    }

    print('finish Init');
  }

  void setModel(DataModel model) {
    box.write('model', model.toJson());
  }

  void resetModel() {
    box.erase();
    box.remove('model');
  }

  DataModel getModel() {
    //print('model: ${box.read('model')}');
    final map = box.read('model');

    return map != null
        ? DataModel.fromJson(map as Map<String, dynamic>)
        : new DataModel();
  }

  Future<PageContent?> getPage({required String slug}) async {
    try {
      isLoading(true);

      var data = getModel();
      var page = data.pages
          ?.firstWhere((e) => e.slug == slug); //, orElse: () => null);
      if (page != null) {
        print('page: ${page.toString()} ');
      }
      return page;
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> fetchSettings() async {
    try {
      isLoading(true);

      DataModel data = getModel();

      if (data.articleCategories?.length != null) {
        print(
            'Cache articles cat: ${data.articleCategories?.length}  pages: ${data.pages?.length} companies: ${data.companies?.length} ');
      }

      if (data.articleCategories?.length == null) {
        print('getting new settings: $data');
        var response = await _api.GET(
          target: '/site-settings/v2?type=2',
        );
        data.settings = response.data?.settings;
        data.articleCategories = response.data?.articleCategories;
        data.block = response.data?.block;
      }

      if (data.pages?.length == 0 || data.pages?.length == null) {
        print('getting pages');
        var response = await _api.GET(target: '/site-settings/pages?type=2');
        data.pages = response.data!.pages;
      }

      if (data.companies?.length == 0 || data.companies?.length == null) {
        print('getting companies');
        var response =
            await _api.GET(target: '/site-settings/companies?type=2');
        data.companies = response.data!.companies;
      }
      pages = data.pages as List<PageContent>;
      companies = data.companies as List<Company>;
      articleCategories = data.articleCategories as List<ArticleCategory>;

      for (final category
          in articleCategories.where((category) => category.menuItem == true)) {
        articlePaths.add(category.slug as String);
      }

      settingsList = data;
      this.setModel(data);

      return data;
    } finally {
      isLoading(false);
    }
  }

  void setAppState(context, AppState appState) {
    this.appState = appState;
    this.context = context;
    this.snackBarMessage(context, 'info', 'AppState Loaded');
    print('test ${appState.username}');
    if (getModel().user!.token != null) {
      var user = getModel().user;
      this.snackBarMessage(
          context, 'info', 'Login: ${user?.fullName} on ${user?.dateOfBirth}');
    }
  }
}

class UsersController extends GetxController {
  var isLoading = true.obs;
  var isLogin = false.obs;
  var token = ''.obs;
  var userList = [].obs;
  dynamic user = ''.obs;
  var page = 1;
  var limit = 10;
  final ApiServices _api = ApiServices();
  // ignore: non_constant_identifier_names
  late HoledoDatabase DB = holedoDatabase;
  var api = Holedoapi();
  @override
  void onInit() {
    //checkLogin();
    // DB = holedoDatabase;
    super.onInit();
  }

  Future<Holedoapi> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final model = getModel();
    try {
      this.isLoading(true);

      api = await _api.POST(target: '/users/login', data: {
        'email': email,
        'password': password
      }, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Device': 'Holedo_Flutter'
      });
      if (api == null) {
        holedoDatabase.snackBarMessage(context, 'error', 'Credential Error...');
      }

      if (api.success == true) {
        user = api.data?.user as User;
        print('login1: ${user.email.toString()} ${api.data?.token}');
        isLogin.value = true;
        token.value = api.data?.token as String;

        model.user?.token = token.value;
        saveUserToModel(user, token.value);
        print('u: ${user.email} ${getModel().user?.token}');
        return api;
      }

      print('login: ${user.email.toString()}');
      return api;
    } finally {
      this.isLoading(false);
    }
  }

  String? getToken(slug) {
    final model = holedoDatabase.getModel();
    print('matchING: $slug USER: ${model.user?.slug}');
    if (model.user?.slug == slug) {
      if (model.token != null) {
        print('match: $slug token: ${model.token}');
        return model.token;
      }
      print('match: $slug token: ${model.user?.token}');
      return model.user?.token;
    }
    return null;
  }

  DataModel getModel() {
    final model = holedoDatabase.getModel();
    if (model.user != null) {
      print('match: ${model.user?.slug} token: ${model.token}');
    }
    return model;
  }

  void saveUserToModel(User user, String token) {
    final model = holedoDatabase.getModel();
    model.token = token;
    model.user = user;
    //print('update user: ${model.user.toString()} token $token');
    //Get.find<HoledoDatabase>().setModel(model);
    try {
      holedoDatabase.setModel(model);
    } finally {
      print('chec: ${holedoDatabase.getModel().user!.email}');
    }
  }

  Future<User> getProfileData({
    String? slug,
    String? id,
    String? token,
    required BuildContext context,
    bool? isLoggined = false,
  }) async {
    try {
      isLoading(true);
      var user = new User();
      var token = getToken(slug);
      var headers = <String, dynamic>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Device': 'Holedo_Flutter'
      };
      if (token != null) {
        //DB.snackBarMessage(context, 'info', 'User Profile being loaded...');
        var auth = <String, dynamic>{'AuthApi': 'Bearer $token'};
        headers.addEntries(auth.entries);
      }
      var params = {'id': id, 'slug': slug, 'token': token};
      print('params: ${headers.toString()}');
      params.removeWhere((k, v) => v == null);

      var response = await _api.GET(
          target: '/users/profile/', data: params, headers: headers);
      //print('log: ${response.data}');
      user = response.data?.user as User;

      if (token != null) {
        print('user: ${user.firstName} token: log: ${token}');
        user.token = token;
        saveUserToModel(user, user.token as String);
      }
      //print('user: ${user.toJson().toString()}');
      return user;
    } finally {
      isLoading(false);
    }
  }

  // Future<User> getSiteSettingsV2({
  //   String? slug,
  //   String? id,
  //   String? token,
  //   required BuildContext context,
  //   bool? isLoggined = false,
  // }) async {
  //   isLoading(true);
  //   final Holedoapi = await ApiServices().getSettings();
  //   if (Holedoapi.data != null) {
  //     Holedoapi.data.settings.generalSettings
  //   } else {
  //     print("No data found");
  //   }
  // }

  Future<List<User>?> fetchUsers(
      {String? category,
      String? type,
      int? limit,
      int? page,
      required BuildContext context,
      String? keyword}) async {
    try {
      isLoading(true);

      var params = {
        'category': category,
        'keyword': keyword,
        'type': type,
        'limit': limit == null ? this.limit : limit,
        'page': page == null ? this.page : page
      };

      params.removeWhere((k, v) => v == null);
      print('context: $context type: $type cat: $category');
      var response = await _api.GET(target: '/users/index', data: params);

      userList.value = response.data!.users as List<User>;

      return userList.value as List<User>;
    } finally {
      isLoading(false);
    }
  }

  void fetchUser({String? slug, String? id}) async {
    try {
      isLoading(true);
      var response = await _api.getUserData(id: id, slug: slug);
      print('log: $response');
      user = response;
    } finally {
      isLoading(false);
    }
  }

  Future<DataModel> saveProfile(context, User user) async {
    try {
      isLoading(true);
      var dataModel = getModel();
      var token = getToken(user.slug);

      if (user.id != null) {
        if (dataModel.user!.id == null) {
          dataModel.messages = 'User Id Not matched';
          DB.snackBarMessage(context, 'info', dataModel.messages);
          return dataModel;
        }
        user.id = dataModel.user?.id;
      }
      if (token == null) {
        dataModel.messages = 'Token Not matched';
        DB.snackBarMessage(context, 'info', dataModel.messages);
        return dataModel;
      }
      var userJson = user.toApiJson();

      var update = await _api.POST(
        target: '/users/update/',
        data: userJson,
        token: token,
      );
      print('Succes: ${update.success} ');
      print('Message: ${update.messages.toString()} ');
      // ignore: unnecessary_null_comparison
      if (update.data != null) {
        var response = await _api.GET(
            target: '/users/get/', data: {'slug': user.slug}, token: token);
        //print('log: ${response.data}');
        dataModel = response.data as DataModel;
        print('log: ${dataModel.user?.firstName}');

        dataModel.user?.token = token;
        saveUserToModel(dataModel.user as User, token);
      }
      // isLoading(false);
      return dataModel;
    } finally {
      isLoading(false);
    }
  }

  Future<User> save(User user) async {
    try {
      isLoading(true);
      var token = this.getToken(user.id);
      var userJson = user.toJson();
      userJson.removeWhere((k, v) => v == null || v.toString().length == 0);
      var update = await _api.POST(
        target: '/users/update/',
        data: userJson,
        token: token,
      );
      // ignore: unnecessary_null_comparison
      if (update.data != null) {
        var response =
            await _api.GET(target: '/users/get/', data: {'slug': user.slug});
        //print('log: ${response.data}');
        user = response.data?.user as User;
        print('log: ${user.firstName}');

        user.token = token;
        saveUserToModel(user, token as String);
      }
      // isLoading(false);
      return user;
    } finally {
      isLoading(false);
    }
  }
}

class NewsController extends GetxController {
  var isLoading = true.obs;
  var dataList = [].obs;
  var article = Article().obs;
  List<Article> articleList = [];
  var page = 1;
  var limit = 10;
  final ApiServices _api = ApiServices();

  Future<Article> getArticle({String? slug, String? id}) async {
    try {
      isLoading(true);

      //var response2 = await _api.getArticle(id: id, slug: slug);
      var response = await _api
          .GET(target: '/articles/get/', data: {'id': id, 'slug': slug});
      print('res: ${response.data?.article}');

      if (response.success == true) {
        article.value = response.data!.article as Article;
      }

      return article.value;
    } finally {
      isLoading(false);
    }
  }

  Future<List<Article>> fetchArticles(
      {String? category,
      String? keyword,
      String? type,
      int? limit,
      int? page,
      required BuildContext context}) async {
    try {
      isLoading(true);
      var params = {
        'category': category,
        'type': type,
        'keyword': keyword,
        'limit': limit == null ? this.limit : limit,
        'page': page == null ? this.page : page
      };
      params.removeWhere((k, v) => v == null);

      print('context: $context type: $type cat: $category');
      var response = await _api.GET(target: '/articles/index', data: params);

      if (response.success == true) {
        var list = response.data!.articles as List<Article>;
        dataList.value = list;

        //print('log: ${list}');
        for (final data in list) {
          //articleList.add(data);
          // print('c ${data.id} ${(articleList.any((e) => e.id == data.id))}');

          if ((articleList.any((e) => e.id == data.id)) != true) {
            // print('adding ${data.id}');
            articleList.add(data);
          }
        }
        print('localcache: count: ${articleList.length}');
      }
      return dataList.value as List<Article>;
    } finally {
      isLoading(false);
    }
  }
}

class JobsController extends GetxController {
  var isLoading = true.obs;
  var dataList = [].obs;
  var job = Job().obs;
  List<Job> jobList = [];
  var page = 1;
  var limit = 10;
  final ApiServices _api = ApiServices();
  @override
  void onInit() {
    //fetch();
    super.onInit();
  }

  Future<Job> getJob({String? slug, String? id}) async {
    try {
      isLoading(true);
      var response = await _api.getJob(id: id, slug: slug);
      job.value = response.data?.job as Job;
      return job.value;
    } finally {
      isLoading(false);
    }
  }

  Future<List<Job>> fetchJobs(
      {int? company,
      String? keyword,
      String? type,
      int? limit,
      int? page,
      required BuildContext context}) async {
    try {
      isLoading(true);

      var params = {
        'company': company,
        'type': type,
        'keyword': keyword,
        'limit': limit == null ? this.limit : limit,
        'page': page == null ? this.page : page
      };
      params.removeWhere((k, v) => v == null);

      print('context: $context type: $type company: $company');
      var response = await _api.GET(target: '/jobs/index', data: params);

      if (response.success == true) {
        var list = response.data!.jobs as List<Job>;
        dataList.value = list;
        for (final data in list) {
          if ((jobList.any((e) => e.id == data.id)) != true) {
            // print('adding ${data.id}');
            jobList.add(data);
          }
        }
        print('localcache: count: ${jobList.length}');
      }
      return dataList.value as List<Job>;
    } finally {
      isLoading(false);
    }
  }
}

class Profile {
  final String title;
  final String id;
  final String? username;
  final List<String> bookIds;

  String get shareUrl => '/profile/$id';

  Profile({
    required this.id,
    required this.title,
    required this.username,
    required this.bookIds,
  });
}
