import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as Store;
import 'package:get_storage/get_storage.dart';
import 'package:holedo/controller/auth_controller.dart';
import '../models/HoledoProfileModel.dart';
import '../models/userProfileModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
          'https://${AuthData.apiHost}/rest/users/register',
          data: data,
          queryParameters: {'apikey': AuthData.apiKey},
          options: Options(headers: {'X-LoginRadius-Sott': AuthData.sott}));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  final userData = GetStorage();

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
  }

  Future<dynamic> getUserProfileData() async {
    try {
      Response response = await _dio.get(
        'https://${AuthData.apiHost}/rest/users/me',
        queryParameters: {'apikey': AuthData.apiKey},
        options: Options(
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
        options: Options(
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
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }*/
    Store.Get.find<AuthController>().resetModel();
  }
}

class LoginApiResponse {
  final String? token;
  final String? error;

  LoginApiResponse({required this.token, required this.error});
}
