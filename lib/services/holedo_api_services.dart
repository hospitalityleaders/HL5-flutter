import 'dart:convert';

import 'package:get/get.dart' as Store;
import 'package:holedo/controller/auth_controller.dart';

//import 'package:get_storage/get_storage.dart';
//import 'package:holedo/controller/auth_controller.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/models/models.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';

//import 'package:dio/dio.dart';
final baseUrl = 'https://${Get.put(HoledoDatabase()).apiHost}/rest';

class ApiServices {
  dio.Dio _dio = dio.Dio();

  Future<Holedoapi?> updateUserProfile() async {
    return null;
  }

  Future<Holedoapi> POST(
      {String? target,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      String? token}) async {
    try {
      var model = new Holedoapi();
      token = token == null ? Get.put(HoledoDatabase()).apiKey : token;
      var header = headers == null
          ? <String, dynamic>{
              'AuthApi': 'Bearer ${token}',
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Device': 'Holedo_Flutter'
            }
          : headers;
      dio.Response response = await _dio.post(
        '${baseUrl}${target}',
        data: data,
        options: dio.Options(
          headers: header,
        ),
        queryParameters: {'apikey': token},
      );

      print('POST URL: ${target}');
      print('POST headers: ${header.toString()}');
      print('POST data:${data.toString()} ');
      //print('POST respomse: ${response}');
      if (response.statusCode == 200 && response.data != null) {
        model = Holedoapi.fromJson(response.data as Map<String, dynamic>);
      }
      return model;
    } on dio.DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<Holedoapi> GET(
      {String? target,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      String? token}) async {
    try {
      var model = new Holedoapi();
      token = token == null ? Get.put(HoledoDatabase()).apiKey : token;
      headers == null
          ? <String, dynamic>{
              'AuthApi': 'Bearer ${token}',
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              'Device': 'Holedo_Flutter'
            }
          : headers;
      dio.Response response = await _dio.get(
        '${baseUrl}${target}',
        options: dio.Options(
          headers: headers,
        ),
        queryParameters: data,
      );
      print('GET URL: ${target}');
      print('GET headers: ${headers.toString()}');
      print('GET data: ${data.toString()}');
      if (response.statusCode == 200 && response.data != null) {
        if (response.data.runtimeType == 'String') {
          response.data = jsonDecode(response.data.toString());
        }
        model = Holedoapi.fromJson(response.data as Map<String, dynamic>);
      }
      return model;
    } catch (e) {
      print('e: ${e.toString()}');
      throw Exception();
    }
  }

  Future<dynamic> logout(String accessToken) async {
    Store.Get.find<AuthController>().resetModel();
    try {
      dio.Response response = await _dio.get(
        'https://${AuthData.apiHost}/rest/users/access_token/InValidate',
        queryParameters: {'apikey': AuthData.apiKey},
        options: dio.Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );

      return response.data;
    } on dio.DioError catch (e) {
      return e.response!.data;
    }
  }

  /*Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
          'https://${AuthData.apiHost}/rest/users/register',
          data: data,
          queryParameters: {'apikey': AuthData.apiKey},
          options: dio.Options(headers: {'X-LoginRadius-Sott': AuthData.sott}));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://${AuthData.apiHost}/rest/users/login',
        data: {
          'email': email,
          'password': password,
        },
        queryParameters: {'apikey': AuthData.apiKey},
      );

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  } Future<dynamic> getUserProfileData() async {
    try {
      Response response = await _dio.get(
        'https://${AuthData.apiHost}/rest/users/me?full=true',
        queryParameters: {'apikey': AuthData.apiKey},
        options: dio.Options(
          headers: <String, dynamic>{
            'AuthApi': 'Bearer ${AuthData.token}',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateUserProfile({
    // required String accessToken,
    required Map<String, dynamic> profileData,
  }) async {
    try {
<<<<<<< HEAD
      final response = await http.get(
          Uri.parse('https://${AuthData.apiHost}/rest/users/get/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'AuthApi': 'Bearer ${userData.read('token')}'
            // 'AuthApi': 'Bearer ${AuthData.token}'
          });
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return HoledoProfileModel.fromJson(data);
      } else {
        return Future.error('Server Error !');
      }
    } catch (SocketException) {
      return Future.error('Error Fetching Data !');
    }
  }

  /// update data
  Future<HoledoProfileModel?> updateUserProfile(
      {required Map<String, dynamic> profileData}) async {
    try {
      final response = await http.post(
        Uri.parse('https://${AuthData.apiHost}/rest/users/update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': AuthData.apiKey,
          'Accept': 'application/json',
          'AuthApi': 'Bearer ${userData.read('token')}'
          // 'AuthApi': 'Bearer ${AuthData.token}'
        },
        body: jsonEncode(profileData),
=======
      Response response = await _dio.post(
        'https://${AuthData.apiHost}/rest/users/update',
        data: profileData,
        queryParameters: {'apikey': AuthData.apiKey},
        options: dio.Options(
          headers: {'AuthApi': 'Bearer ${AuthData.token}'},
        ),
>>>>>>> 95209db0a577d43c2a004d0f78d5a93b376ad6a9
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    /*try {
      Response response = await _dio.get(
        'https://${AuthData.apiHost}/rest/users/access_token/InValidate',
        queryParameters: {'apikey': AuthData.apiKey},
        options: dio.Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }*/
    Store.Get.find<AuthController>().resetModel();
  }static Future<Response> getData(
      String url, Map<String, String> headers) async {
    var file = await MyCacheManager().getSingleFile(url, headers);
    if (file != null && await file.exists()) {
      var res = await file.readAsString();
      return Response(request: res, statusCode: 200);
    }
    return Response(request: null, statusCode: 404);
  }*/
  Future<Holedoapi> login(
      {required String email, required String password}) async {
    //try {
    var url = '${baseUrl}' + '/users/login';
    var data;
    dio.Response response = await _dio.post(
      url,
      data: {
        'email': email,
        'password': password,
      },
      queryParameters: {'apikey': Get.put(HoledoDatabase()).apiKey},
    );
    print('URL: ${url}');

    if (response.statusCode == 200 && response.data['success'] == true) {
      //user = User.fromJson(
      //    response.data!['data']!['user'] as Map<String, dynamic>);

      //print('res: ${user}');
      print('data: ${response.data!['data']!['user'] as Map<String, dynamic>}');
      //return User.fromJson(response.data.user as Map<String, dynamic>);
      data = Holedoapi.fromJson(response.data as Map<String, dynamic>);
    }
    return data as Holedoapi;
    //throw Exception();
    //} on my.DioError catch (e) {
    //  throw Exception();
    //}
  }

  Future<User> getUserData({
    String? slug,
    String? id,
    String? token,
  }) async {
    var url = "${baseUrl}" + "/users/get";
    var data;
    //url += id != null ? 'id=${id}' : '';
    //url += slug != null ? 'slug=${slug}' : '';

    token = token == null ? Get.put(HoledoDatabase()).token : token;

    dio.Response response = await _dio.get(url,
        queryParameters: {'id': id, 'slug': slug},
        options: dio.Options(
          headers: {
            'AuthApi': 'Bearer ${token}',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ));
    print('URL: ${response.statusCode}');
    print('URL: ${response.data['success']}');
    if (response.statusCode == 200 && response.data['success'] == true) {
      data = response.data['data']['user'];
    } else {
      print('errr: ');

      /// throw Exception();
    }
    return User.fromJson(data as Map<String, dynamic>);
  }

  Future<List<Article>> getArticleList(
      {String? category,
      String? type,
      required int limit,
      required int page}) async {
    try {
      var url = "${baseUrl}" +
          "/articles/index?limit=${limit}&page=${page}&category=${category}&type=${type}";
      print('URL: ${url}');
      dio.Response response =
          await _dio.get(url, options: buildCacheOptions(Duration(days: 7)));

      if (response.statusCode == 200 && response.data['success'] == true) {
        var list =
            getArticles(response.data['data']['articles'] as Iterable<dynamic>);

        return list;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<Holedoapi> getArticle({String? id, String? slug}) async {
    var url = "${baseUrl}" + "/articles/get?";
    url += id != null ? 'id=${id}' : '';
    url += slug != null ? 'slug=${slug}' : '';

    print('URL: ${url}');
    dio.Response response =
        await _dio.get(url, options: buildCacheOptions(Duration(days: 7)));
    if (response.statusCode == 200 && response.data['success'] == true) {
      var data = response.data as Map<String, dynamic>;
      return Holedoapi.fromJson(data);
    } else {
      throw Exception();
    }
  }

  Future<Holedoapi> getSettings() async {
    try {
      var data = new Holedoapi();
      var url = "${baseUrl}" + "/site-settings/v2?type=2";
      //_dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://www.google.com")).interceptor);
      dio.Response response = await _dio.get(url);
      print('URL: ${url}');
      if (response.statusCode == 200 && response.data['success'] == true) {
        data = Holedoapi.fromJson(response.data as Map<String, dynamic>);
      }
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Job>> getJobsList(
      {String? category,
      String? type,
      required int limit,
      required int page}) async {
    var url = "${baseUrl}" +
        "/jobs/index?limit=${limit}&page=${page}&category=${category}&type=${type}";
    var token = 'Bearer ${Get.put(HoledoDatabase()).token}';
    dio.Response response = await _dio.get(url,
        options: dio.Options(
          headers: {
            'AuthApi': '${token}',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ));
    print('URL: ${url}');
    if (response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;

      var list = getJobs(data['data']['jobs'] as Iterable<dynamic>);

      return list;
    } else {
      throw Exception();
    }
  }

  Future<Holedoapi> getJob({String? id, String? slug}) async {
    var url = "${baseUrl}" + "/jobs/get?";
    url += id != null ? 'id=${id}' : '';
    url += slug != null ? 'slug=${slug}' : '';

    print('URL: ${url}');
    var token = 'Bearer ${Get.put(HoledoDatabase()).token}';
    dio.Response response = await _dio.get(url,
        options: dio.Options(
          headers: {
            'AuthApi': '${token}',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ));
    if (response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      return Holedoapi.fromJson(data);
    } else {
      throw Exception();
    }
  }
}

class LoginApiResponse {
  final String? token;
  final String? error;

  LoginApiResponse({required this.token, required this.error});
}
