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
      userData.write('isLogined', true);
      userData.write('email', email);

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<HoledoProfileModel> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://${AuthData.apiHost}/rest/users/me',
        queryParameters: {'apikey': AuthData.apiKey},
        options: Options(
          headers: <String, dynamic>{
            'AuthApi': 'Bearer $accessToken',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );

      // return response.data;
      if (response.statusCode == 200) {
        final model = Store.Get.put(AuthController()).restoreModel();
        model.setData = HoledoProfileModel.fromJson(response.data);
        Store.Get.find<AuthController>().authModel(model);
        return model.data;
      } else {
        return HoledoProfileModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<HoledoProfileModel> updateUserProfile({
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
      if (response.statusCode == 200) {
        final model = Store.Get.put(AuthController()).restoreModel();
        model.setData = HoledoProfileModel.fromJson(response.data);
        Store.Get.find<AuthController>().authModel(model);
        return model.setData;
      } else {
        return HoledoProfileModel.fromJson(response.data);
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



 Future<HoledoProfileModel> getUserApi(String accessToken) async {
  var uri = 'https://${AuthData.apiHost}/rest/users/me';

  final response = await http.get(Uri.parse(uri),
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'AuthApi': 'Bearer $accessToken'
  });
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return HoledoProfileModel.fromJson(data);
  } else {
    return HoledoProfileModel.fromJson(data);
  }
}


}

class LoginApiResponse {
  final String? token;
  final String? error;

  LoginApiResponse({required this.token, required this.error});
}
