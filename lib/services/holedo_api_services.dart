import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Store;

import 'package:get_storage/get_storage.dart';
import 'package:holedo/controller/auth_controller.dart';

import '../models/userProfileModel.dart';

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
      userData.write('isLogined', true);
      userData.write('email', email);

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<UserProfileModel> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://${AuthData.apiHost}/rest/users/me',
        queryParameters: {'apikey': AuthData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );

      // return response.data;
      if (response.statusCode == 200) {
        final model = Store.Get.put(AuthController()).restoreModel();
        model.setData = UserProfileModel.fromJson(response.data);
        Store.Get.find<AuthController>().authModel(model);
        return model.setData;
      } else {
        return UserProfileModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<UserProfileModel> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> profileData,
  }) async {
    try {
      Response response = await _dio.post(
        'https://${AuthData.apiHost}/rest/users/update',
        data: profileData,
        queryParameters: {'apikey': AuthData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      if (response.statusCode == 200) {
        final model = Store.Get.put(AuthController()).restoreModel();
        model.setData = UserProfileModel.fromJson(response.data);
        Store.Get.find<AuthController>().authModel(model);
        return model.setData;
      } else {
        return UserProfileModel.fromJson(response.data);
      }
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
