import 'dart:convert';

//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:get/get.dart' as Store;
import 'package:holedo/controller/auth_controller.dart';
//import 'package:get_storage/get_storage.dart';
//import 'package:holedo/controller/auth_controller.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/utill/api_urls.dart';

//import 'package:dio/dio.dart';
final baseUrl = 'https://${Get.put(HoledoDatabase()).apiHost}/rest';

class ApiServices {
  final dio.Dio _dio = dio.Dio();

  Future<Holedoapi?> updateUserProfile() async {
    return null;
  }

  Future<Holedoapi> POST({
    String? target,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    try {
      var model = Holedoapi();
      token ??= Get.put(HoledoDatabase()).token;
      final header = headers ??
          <String, dynamic>{
            'AuthApi': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Device': 'Holedo_Flutter'
          };

      final dio.Response response = await _dio.post(
        '$baseUrl$target',
        data: data,
        options: dio.Options(
          headers: header,
        ),
        //queryParameters: {'apikey': token},
      );

      debugPrint('POST URL: $target');
      debugPrint('POST headers: ${header.toString()}');
      //debugPrint('GET data: ${response.toString()}');
      //debugPrint('POST respomse: ${response.statusMessage}');
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data != '') {
        if (response.data.runtimeType == 'String') {
          response.data = jsonDecode(response.data.toString());
        }
        model = Holedoapi.fromJson(response.data as Map<String, dynamic>);
      }
      return model;
    } on dio.DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<Holedoapi> GET({
    String? target,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    try {
      Holedoapi model = Holedoapi();
      token = token ?? AppUrls.token;
      final header = headers ?? AppUrls.defaultHeadersCustomToken(token);

      debugPrint('GET URL: $baseUrl$target');
      debugPrint('GET headers: ${header.toString()}');
      final dio.Response response = await _dio.get(
        '$baseUrl$target',
        options: dio.Options(
          headers: header,
        ),
        queryParameters: data,
      );

      //if (target == '/site-settings/v2?type=2')
      debugPrint('GET data: ${response.statusCode.toString()}');
      if (response.statusCode == 200 && response.data != null) {
        if (response.data.runtimeType == 'String') {
          response.data = jsonDecode(response.data.toString());
        }
        if (response.data['data'] != null &&
            target == '/site-settings/v2?type=2') {
          //debugPrint(
          //    'model : ${response.data['data']['settings']['achievement_types'].toString()}');
          // Settings ty = Settings.fromJson(response.data['data']['settings']);

          // Settings test = ty;

          // debugPrint('model : ${ty.toJson().toString()}');
        }
        model = Holedoapi.fromJson(response.data as Map<String, dynamic>);
        // debugPrint('model : ${model.toString()}');
      }
      return model;
    } catch (e) {
      debugPrint('e: ${e.toString()}');
      throw Exception();
    }
  }

  Future<Holedoapi> PUT({
    String? target,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    try {
      Holedoapi model = Holedoapi();
      token = token ?? AppUrls.token;
      final header = headers ?? AppUrls.defaultHeadersCustomToken(token);

      debugPrint('GET URL: $baseUrl$target');
      debugPrint('GET headers: ${header.toString()}');
      final dio.Response response = await _dio.put(
        '$baseUrl$target',
        options: dio.Options(
          headers: header,
        ),
        queryParameters: data,
      );

      //if (target == '/site-settings/v2?type=2')
      debugPrint('GET data: ${response.data.toString()}');
      if (response.statusCode == 200 && response.data != null) {}
      return model;
    } catch (e) {
      debugPrint('e: ${e.toString()}');
      throw Exception();
    }
  }

  Future<dynamic> logout(String accessToken) async {
    Store.Get.find<AuthController>().resetModel();
    try {
      final dio.Response response = await _dio.get(
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
      Response response = await _dio.post(
        'https://${AuthData.apiHost}/rest/users/update',
        data: profileData,
        queryParameters: {'apikey': AuthData.apiKey},
        options: dio.Options(
          headers: {'AuthApi': 'Bearer ${AuthData.token}'},
        ),
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
  }
  Future<Holedoapi> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = '$baseUrl/users/login';
      late Holedoapi data;
      final dio.Response response = await _dio.post(
        url,
        data: {
          'email': email,
          'password': password,
        },
        queryParameters: {'apikey': Get.put(HoledoDatabase()).apiKey},
      );
      debugPrint('URL: $url');

      if (response.statusCode == 200 && response.data['success'] == true) {
        //user = User.fromJson(
        //    response.data!['data']!['user'] as Map<String, dynamic>);

        //debugPrint('res: ${user}');
        debugPrint(
          'data: ${response.data!['data']!['user'] as Map<String, dynamic>}',
        );
        //return User.fromJson(response.data.user as Map<String, dynamic>);
        return Holedoapi.fromJson(response.data as Map<String, dynamic>);
      }

      throw Exception();
    } on dio.DioError {
      throw Exception();
    }
  }

  Future<User> getUserData({
    String? slug,
    String? id,
    String? token,
  }) async {
    final url = "$baseUrl/users/get";
    late final data;
    //url += id != null ? 'id=${id}' : '';
    //url += slug != null ? 'slug=${slug}' : '';

    token ??= Get.put(HoledoDatabase()).token;

    final dio.Response response = await _dio.get(
      url,
      queryParameters: {'id': id, 'slug': slug},
      options: dio.Options(
        headers: {
          'AuthApi': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      ),
    );
    debugPrint('URL: ${response.statusCode}');
    debugPrint('URL: ${response.data['success']}');
    if (response.statusCode == 200 && response.data['success'] == true) {
      data = response.data['data']['user'];
    } else {
      debugPrint('errr: ');

      /// throw Exception();
    }
    return User.fromJson(data as Map<String, dynamic>);
  }

  Future<List<Article>> getArticleList({
    String? category,
    String? type,
    required int limit,
    required int page,
  }) async {
    try {
      final url =
          "$baseUrl/articles/index?limit=$limit&page=$page&category=$category&type=$type";
      debugPrint('URL: $url');
      final dio.Response response = await _dio.get(
        url,
        options: buildCacheOptions(const Duration(days: 7)),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final list =
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
    var url = "$baseUrl/articles/get?";
    url += id != null ? 'id=$id' : '';
    url += slug != null ? 'slug=$slug' : '';

    debugPrint('URL: $url');
    final dio.Response response = await _dio.get(
      url,
      options: buildCacheOptions(const Duration(days: 7)),
    );
    if (response.statusCode == 200 && response.data['success'] == true) {
      final data = response.data as Map<String, dynamic>;
      return Holedoapi.fromJson(data);
    } else {
      throw Exception();
    }
  }

  Future<Holedoapi> getSettings() async {
    try {
      var data = Holedoapi();
      final url = "$baseUrl/site-settings/v2?type=2";
      //_dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://www.google.com")).interceptor);
      final dio.Response response = await _dio.get(url);
      debugPrint('URL: $url');
      if (response.statusCode == 200 && response.data['success'] == true) {
        data = Holedoapi.fromJson(response.data as Map<String, dynamic>);
      }
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Job>> getJobsList({
    String? category,
    String? type,
    required int limit,
    required int page,
  }) async {
    final url =
        "$baseUrl/jobs/index?limit=$limit&page=$page&category=$category&type=$type";
    final token = 'Bearer ${Get.put(HoledoDatabase()).token}';
    final dio.Response response = await _dio.get(
      url,
      options: dio.Options(
        headers: {
          'AuthApi': token,
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      ),
    );
    debugPrint('URL: $url');
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;

      final list = getJobs(data['data']['jobs'] as Iterable<dynamic>);

      return list;
    } else {
      throw Exception();
    }
  }

  Future<Holedoapi> getJob({String? id, String? slug}) async {
    var url = "$baseUrl/jobs/get?";
    url += id != null ? 'id=$id' : '';
    url += slug != null ? 'slug=$slug' : '';

    debugPrint('URL: $url');
    final token = 'Bearer ${Get.put(HoledoDatabase()).token}';
    final dio.Response response = await _dio.get(
      url,
      options: dio.Options(
        headers: {
          'AuthApi': token,
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return Holedoapi.fromJson(data);
    } else {
      throw Exception();
    }
  }*/
}
