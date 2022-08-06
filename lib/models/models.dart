import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holedo/main.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';
import 'package:holedo/services/holedo_api_services.dart';

export 'package:get/get.dart';
export 'package:provider/provider.dart';
export 'package:holedo/profile/presentation/providers/profile_provider.dart';
export 'holedoapi/holedoapi.dart';
import 'package:holedo/models/holedoapi/menu.dart';
import 'package:holedo/models/models.dart';
import 'package:flat/flat.dart';

class Model {
  fetch(dynamic o, [String? t, String? s]) {
    var model = o.runtimeType != 'String' ? this : o;

    final splitted = o.split('.');
    final flat = flatten(model?.toJson(), maxDepth: splitted.length);
    if (o != 'Menus') {
      print('settings: $t $s ${flat[o].toString()}');
      debugPrint('flat $o ${splitted.length}');
    }
    if (flat[o] != null) {
      //return flat[s];

      if (t != null && s != null) {
        var result;
        switch (splitted[splitted.length - 1]) {
          case 'Menus':
            result = Menu.fromJson(flat[o].firstWhere((e) => e[t] == s))
                .children as List<Menu>;
            break;
        }

        //debugPrint('result ${result.toString()}');
        return result;
      }
    }
    //debugPrint('flat ${flat.toString()}');
    //return model;
  }
}

class HoledoDatabase extends GetxController {
  RxBool isLoading = true.obs;
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
  late AppProvider appState;
  late BuildContext context;

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

  Future<void> getArticleCategories() async {
    articleCategories = getModel().articleCategories!;
  }

  final NewsController news = NewsController();
  final UsersController users = UsersController();
  final JobsController jobs = JobsController();

  Future<void> init() async {
    await GetStorage.init();
    //this.resetModel();
    debugPrint('starting website... ');

    await fetchSettings();

    final model = getModel();
    if (model.token != null || model.user?.fullName != null) {
      debugPrint(
        'cached user: ${model.user?.id} ${model.user?.fullName} ${model.user?.token}',
      );
    }

    await fetchIdentities();

    debugPrint('finish Init');
  }

  void setModel(DataModel model) {
    box.write('model', model.toJson());
  }

  void resetModel() {
    box.erase();
    box.remove('model');
  }

  void logout() {
    final data = getModel();
    data.user = null;
    data.token = null;
    setModel(data);
  }

  DataModel getModel() {
    //debugPrint('model: ${box.read('model')}');
    final map = box.read('model');

    return map != null
        ? DataModel.fromJson(map as Map<String, dynamic>)
        : DataModel();
  }

  Future<PageContent?> getPage({required String slug}) async {
    try {
      isLoading(true);

      final data = getModel();
      final page = data.pages
          ?.firstWhere((e) => e.slug == slug, orElse: () => new PageContent());
      if (page != null) {
        debugPrint('page: ${page.toJson().toString()} ');
      }
      return page;
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> fetchSettings() async {
    try {
      isLoading(true);

      var data = getModel();

      if (data.settings?.articleCategories?.length != null) {
        debugPrint(
          'Cache articles cat: ${data.articleCategories?.length}  pages: ${data.pages?.length} companies: ${data.companies?.length} ',
        );
      }

      if (data.settings?.articleCategories?.length == null) {
        debugPrint('getting new settings: $data');
        final response = await _api.GET(
          target: '/site-settings/v2?type=2',
        );

        data = response.data as DataModel;
      }

      if ((data.pages?.isEmpty ?? true) || data.pages?.length == null) {
        debugPrint('getting pages');
        final response = await _api.GET(target: '/site-settings/pages?type=2');
        data.pages = response.data!.pages;
      }

      if ((data.pages?.isEmpty ?? true) || data.companies?.length == null) {
        debugPrint('getting companies');
        final response =
            await _api.GET(target: '/site-settings/companies?type=2');
        data.companies = response.data!.companies;
      }
      this.pages = data.pages as List<PageContent>;
      this.companies = data.companies as List<Company>;
      articleCategories =
          data.settings?.articleCategories as List<ArticleCategory>;

      for (final category
          in articleCategories.where((category) => category.menuItem == true)) {
        articlePaths.add(category.slug as String);
      }

      settingsList = data;
      setModel(data);

      return data;
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> fetchIdentities() async {
    try {
      isLoading(true);

      var data = getModel();

      if (data.user == null) {
        debugPrint(
          'checking Identity ',
        );
        final response = await _api.GET(
          target: '/users/sso',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Device': 'Holedo_Flutter'
          },
        );

        data.identities = response.data?.identities;
        data.identity = response.data?.identity;
        //data.token = response.data?.token;

        debugPrint(
          'token ${data.token} ${response.data?.token}',
        );
        debugPrint(
          'identity ${data.identity}',
        );
        var ident = data.identities?.first;

        debugPrint(
          'idents ${ident?.toJson().toString()}',
        );
        if (ident?.sessionToken != null) {
          data.token = ident?.sessionToken;
          data.user = ident?.user;
        }

        if (data.token != null) {
          final api = await _api.PUT(
            target: '/users/token/?token=${data.token}',
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Device': 'Holedo_Flutter'
            },
          );
          //data.user = api.data?.user;

          debugPrint(
            'saving identity ${api.data?.user?.fullName}',
          );
        }
        setModel(data);
      }

      return data;
    } finally {
      isLoading(false);
    }
  }

  void setAppState(BuildContext context, AppProvider appState) {
    this.appState = appState;
    this.context = context;
    snackBarMessage(context, 'info', 'AppState Loaded');
    debugPrint('test ${appState.username}');
    if (getModel().user!.token != null) {
      final user = getModel().user;
      snackBarMessage(
        context,
        'info',
        'Login: ${user?.fullName} on ${user?.dateOfBirth}',
      );
    }
  }
}

class UsersController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isLogin = false.obs;
  RxString token = ''.obs;
  RxList userList = [].obs;
  dynamic user = ''.obs;
  int page = 1;
  int limit = 10;
  final ApiServices _api = ApiServices();
  // ignore: non_constant_identifier_names
  late HoledoDatabase DB = holedoDatabase;

  Future<User> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      DB.isLoading(true);
      var api = Holedoapi();
      final model = DB.getModel();
      var user = User();

      api = await _api.POST(
        target: '/users/login',
        data: {'email': email, 'password': password},
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Device': 'Holedo_Flutter'
        },
      );

      if (api.success == true) {
        debugPrint('login: ${api.data!.user!.email.toString()}');
        isLogin.value = true;
        token.value = api.data?.token as String;
        user = api.data?.user as User;
        model.user?.token = api.data?.token;
        saveUserToModel(user, api.data?.token);
      } else {
        //DB.snackBarMessage(context, 'error', api.errors.toString());
      }
      return user;
    } finally {
      DB.isLoading(false);
    }
  }

  String? getToken(slug) {
    final model = holedoDatabase.getModel();
    debugPrint('matchING: $slug USER: ${model.user?.slug}');
    if (model.user?.slug == slug) {
      if (model.token != null) return model.token;
      debugPrint('match: $slug token: ${model.user?.token}');
      return model.user?.token;
    }
    return null;
  }

  DataModel getModel() {
    final model = holedoDatabase.getModel();
    if (model.user != null) {
      debugPrint('match: ${model.user?.slug} token: ${model.token}');
    }
    return model;
  }

  void saveUserToModel(User user, String? token) {
    final model = holedoDatabase.getModel();
    model.token = token;
    model.user = user;
    //debugPrint('update user: ${model.user.toString()} token $token');
    //Get.find<HoledoDatabase>().setModel(model);
    holedoDatabase.setModel(model);
  }

  Future<User> getOtherUserProfile({
    String? slug,
    String? id,
    String? token,
    required BuildContext context,
    bool? isLoggined = false,
  }) async {
    try {
      isLoading(true);
      var user = User();
      final token = getToken(slug);
      final headers = <String, dynamic>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Device': 'Holedo_Flutter'
      };
      if (token != null) {
        //DB.snackBarMessage(context, 'info', 'User Profile being loaded...');
        final auth = <String, dynamic>{'AuthApi': 'Bearer $token'};
        headers.addEntries(auth.entries);
      }
      final params = {'id': id, 'slug': slug, 'token': token};
      debugPrint('params: ${headers.toString()}');
      params.removeWhere((k, v) => v == null);

      final response = await _api.GET(
        target: '/users/profile/',
        data: params,
        headers: headers,
      );
      //debugPrint('log: ${response.data}');
      return response.data?.user as User;
      // if (token != null) {
      //   debugPrint('user: ${user.firstName} token: log: $token');
      //   user.token = token;
      //   saveUserToModel(user, user.token);
      // }
      //debugPrint('user: ${user.toJson().toString()}');

    } finally {
      isLoading(false);
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
      // isLoading(true);
      var user = User();
      final token = getToken(slug);
      final headers = <String, dynamic>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Device': 'Holedo_Flutter'
      };
      if (token != null) {
        //DB.snackBarMessage(context, 'info', 'User Profile being loaded...');
        final auth = <String, dynamic>{'AuthApi': 'Bearer $token'};
        headers.addEntries(auth.entries);
      }
      final params = {'id': id, 'slug': slug, 'token': token};
      debugPrint('params: ${headers.toString()}');
      params.removeWhere((k, v) => v == null);

      final response = await _api.GET(
        target: '/users/profile/',
        data: params,
        headers: headers,
      );
      //debugPrint('log: ${response.data}');
      user = response.data?.user as User;

      if (token != null && id != null) {
        debugPrint('user: ${user.firstName} token: log: $token');
        user.token = token;
        saveUserToModel(user, user.token);
      }
      //debugPrint('user: ${user.toJson().toString()}');
      return user;
    } finally {
      // isLoading(false);
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
  //     debugPrint("No data found");
  //   }
  // }

  Future<List<User>?> fetchUsers({
    String? category,
    String? type,
    int? limit,
    int? page,
    required BuildContext context,
    String? keyword,
  }) async {
    try {
      isLoading(true);

      final params = {
        'category': category,
        'keyword': keyword,
        'type': type,
        'limit': limit ?? this.limit,
        'page': page ?? this.page
      };

      params.removeWhere((k, v) => v == null);
      debugPrint('context: $context type: $type cat: $category');
      final response = await _api.GET(target: '/users/index', data: params);

      userList.value = response.data!.users as List<User>;

      return userList.value as List<User>;
    } finally {
      isLoading(false);
    }
  }

  Future<DataModel> saveProfile(User user) async {
    var dataModel = getModel();

    try {
      isLoading(true);
      final token = dataModel.token;

      if (user.id != null) {
        if (dataModel.user!.id == null) {
          dataModel.messages = 'User Id Not matched';
          return dataModel;
        }
        user.id = dataModel.user?.id;
      }
      if (token == null) {
        dataModel.messages = 'Token Not matched';
        return dataModel;
      }
      final userJson = user.toApiJson();

      final update = await _api.POST(
        target: '/users/update/',
        data: userJson,
        token: token,
      );
      debugPrint('Succes: ${update.success} ');
      debugPrint('Message: ${update.messages.toString()} ');
      // ignore: unnecessary_null_comparison
      if (update.data != null) {
        final response = await _api.GET(
          target: '/users/get/',
          data: {'slug': user.slug},
          token: token,
        );
        //debugPrint('log: ${response.data}');
        dataModel = response.data as DataModel;
        debugPrint('log: ${dataModel.user?.firstName}');

        dataModel.user?.token = token;
        saveUserToModel(dataModel.user as User, token);
      }
      // isLoading(false);
      return dataModel;
    } catch (e) {
      return dataModel;
    } finally {
      isLoading(false);
    }
  }

  Future<User> save(User user) async {
    try {
      isLoading(true);
      final token = getToken(user.id);
      final userJson = user.toJson();
      userJson.removeWhere((k, v) => v == null || v.toString().isEmpty);
      final update = await _api.POST(
        target: '/users/update/',
        data: userJson,
        token: token,
      );
      // ignore: unnecessary_null_comparison
      if (update.data != null) {
        final response =
            await _api.GET(target: '/users/get/', data: {'slug': user.slug});
        //debugPrint('log: ${response.data}');
        user = response.data?.user as User;
        debugPrint('log: ${user.firstName}');

        user.token = token;
        saveUserToModel(user, token);
      }
      // isLoading(false);
      return user;
    } finally {
      isLoading(false);
    }
  }
}

class NewsController extends GetxController {
  RxBool isLoading = true.obs;
  RxList dataList = [].obs;
  Rx<Article> article = Article().obs;
  List<Article> articleList = [];
  int page = 1;
  int limit = 10;
  final ApiServices _api = ApiServices();

  Future<Article> getArticle({String? slug, String? id}) async {
    try {
      isLoading(true);

      //var response2 = await _api.getArticle(id: id, slug: slug);
      final response = await _api
          .GET(target: '/articles/get/', data: {'id': id, 'slug': slug});
      debugPrint('res: ${response.data?.article}');

      if (response.success == true) {
        article.value = response.data!.article as Article;
      }

      return article.value;
    } finally {
      isLoading(false);
    }
  }

  Future<List<Article>> fetchArticles({
    String? category,
    String? keyword,
    String? type,
    int? limit,
    int? page,
    required BuildContext context,
  }) async {
    try {
      isLoading(true);
      final params = {
        'category': category,
        'type': type,
        'keyword': keyword,
        'limit': limit ?? this.limit,
        'page': page ?? this.page
      };
      params.removeWhere((k, v) => v == null);

      debugPrint('context: $context type: $type cat: $category');
      final response = await _api.GET(target: '/articles/index', data: params);

      if (response.success == true) {
        final list = response.data!.articles as List<Article>;
        dataList.value = list;

        //debugPrint('log: ${list}');
        for (final data in list) {
          //articleList.add(data);
          // debugPrint('c ${data.id} ${(articleList.any((e) => e.id == data.id))}');

          if ((articleList.any((e) => e.id == data.id)) != true) {
            // debugPrint('adding ${data.id}');
            articleList.add(data);
          }
        }
        debugPrint('localcache: count: ${articleList.length}');
      }
      return dataList.value as List<Article>;
    } finally {
      isLoading(false);
    }
  }
}

class JobsController extends GetxController {
  RxBool isLoading = true.obs;
  RxList dataList = [].obs;
  Rx<Job> job = Job().obs;
  List<Job> jobList = [];
  int page = 1;
  int limit = 10;
  final ApiServices _api = ApiServices();

  Future<Job> getJob({String? slug, String? id}) async {
    try {
      isLoading(true);

      final params = {'id': id, 'slug': slug};
      params.removeWhere((k, v) => v == null);

      debugPrint('context: ${params.toString()}');
      final response = await _api.GET(target: '/jobs/get', data: params);

      job.value = response.data?.job as Job;
      return job.value;
    } finally {
      isLoading(false);
    }
  }

  Future<List<Job>> fetchJobs({
    int? company,
    String? keyword,
    String? type,
    int? limit,
    int? page,
    required BuildContext context,
  }) async {
    try {
      isLoading(true);

      final params = {
        'company': company,
        'type': type,
        'keyword': keyword,
        'limit': limit ?? this.limit,
        'page': page ?? this.page
      };
      params.removeWhere((k, v) => v == null);

      debugPrint('context: $context type: $type company: $company');
      final response = await _api.GET(target: '/jobs/index', data: params);

      if (response.success == true) {
        final list = response.data!.jobs!;
        dataList.value = list;
        for (final data in list) {
          if ((jobList.any((e) => e.id == data.id)) != true) {
            // debugPrint('adding ${data.id}');
            jobList.add(data);
          }
        }
        debugPrint('localcache: count: ${jobList.length}');
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
