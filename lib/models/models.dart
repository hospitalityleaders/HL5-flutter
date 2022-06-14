export 'package:get/get.dart';
export 'holedoapi/holedoapi.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/models/holedoapi/company.dart';
import 'package:holedo/models/holedoapi/page.dart';

import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/services/holedo_api_services.dart';
import 'holedoapi/data.dart';

class AppState extends ChangeNotifier {
  AppState({String? username, User? profile})
      : _username = username,
        _profile = profile;

  bool get isLoggedIn => _username != null;

  String? _username;
  User? _profile;
  String? get username => _username;

  set data(String data) {}
  set username(String? value) {
    _username = value;
    notifyListeners();
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

  NewsController get news => Get.put(NewsController());
}

class HoledoDatabase extends GetxController {
  var isLoading = true.obs;
  final apiHost = 'api.holedo.com';
  final apiKey = 'holedo_flutter_tests';
  final token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM2MDgsImV4cCI6MTk2NzU1MDk5MH0.TTXGrAWbFkpMgjzzh2kly0RqyLxc_NzPIlyr7nzvc_I';
  final box = GetStorage();
  DataModel? settingsList;
  List<ArticleCategory> articleCategories = [];
  List<Article> articles = [];
  List<Page> pages = [];
  List<Company> companies = [];
  final List<String> articlePaths = [];
  final ApiServices _api = ApiServices();

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

    final model = await this.fetchSettings();
    // final model = getModel();
    if (model.user?.fullName != null) {
      print('cached user: ${model.user?.fullName}');
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

  Future<Page> getPage({required String slug}) async {
    try {
      isLoading(true);

      var data = getModel();
      var page = data.pages?.firstWhere(
        (e) => e.slug == slug,
      );
      if (page != null) {
        print('page: ${page.toString()} ');
      }
      return page as Page;
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> fetchSettings() async {
    try {
      isLoading(true);

      var data = getModel();

      if (data.articleCategories?.length != null) {
        print(
            'Cache articles cat: ${data.articleCategories?.length}  pages: ${data.pages?.length} companies: ${data.companies?.length} ');
      }

      if (data.articleCategories?.length == null) {
        print('getting new settings: ${data}');
        var response = await _api.GET(target: '/site-settings/?type=2');
        data = response.data as DataModel;
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
      pages = data.pages as List<Page>;
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

  @override
  void onInit() {
    //checkLogin();
    super.onInit();
  }

  Future<User> login({required String email, required String password}) async {
    try {
      isLoading(true);
      var user = new User();
      //var response = await _api.login(email: email, password: password);

      var response = await _api.POST(
          target: '/users/login', data: {'email': email, 'password': password});

      if (response.success == true) {
        print('login: ${response.data!.user!.email.toString()}');
        isLogin.value = true;
        token.value = response.data?.token as String;

        user = response.data?.user as User;
        final model = Get.put(HoledoDatabase()).getModel();
        model.token = response.data?.token;
        model.user = user;
        print('db save: ${model.user}');
        Get.find<HoledoDatabase>().setModel(model);
      }
      return user;
    } finally {
      isLoading(false);
    }
  }

  Future<User> getProfileData(
      {String? slug,
      String? id,
      String? token,
      required BuildContext context}) async {
    try {
      isLoading(true);
      var user = new User();
      final model = Get.put(HoledoDatabase()).getModel();
      if (model.user?.slug == slug) {
        print('natch: ${slug} token: ${model.token}');
        token = model.token;
      }
      var params = {'id': id, 'slug': slug, 'token': token};
      params.removeWhere((k, v) => v == null);

      var response = await _api.GET(target: '/users/get/', data: params);
      print('log: ${response.data}');
      user = response.data?.user as User;
      print('log: ${user.firstName}');

      if (model.user?.slug == slug) {
        model.user = user;
        print('update user: ${model.user}');
        Get.find<HoledoDatabase>().setModel(model);
      }
      return user;
    } finally {
      isLoading(false);
    }
  }

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
      print('context: ${context} type: ${type} cat: ${category}');
      var response = await _api.GET(target: '/users/index', data: params);

      userList.value = response.data!.users as List<User>;

      return userList.value as List<User>;
    } finally {
      isLoading(false);
    }
  }

  void fetch({String? slug, String? id}) async {
    try {
      isLoading(true);
      var response = await _api.getUserData(id: id, slug: slug);
      print('log: ${response}');
      user = response;
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
  //@override
  //void onInit() {
  //fetch();
  //super.onInit();
  //r}

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

      print('context: ${context} type: ${type} cat: ${category}');
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

      print('context: ${context} type: ${type} company: ${company}');
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