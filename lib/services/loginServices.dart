import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holedo/controller/auth_controller.dart';
import 'package:http/http.dart' as http;
import '../models/userProfileModel.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
          'https://api.holedo.com/rest/users/register',
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
        'https://api.holedo.com/rest/users/login',
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
        'https://api.holedo.com/rest/users/me',
        queryParameters: {'apikey': AuthData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      // return response.data;
      if (response.statusCode == 200) {
        return UserProfileModel.fromJson(response.data);
      } else {
        return UserProfileModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<User?> updateUserProfile({
    required String accessToken,
    required User user,
    required String profileSummary,
  }) async {
    User? updatedUser;
    try {
      Response response = await _dio.put(
        'https://api.holedo.com/rest/users/me',
        data: user.toJson(),
        queryParameters: {'apikey': AuthData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      // return response.data;
      print('User updated: ${response.data}');
      updatedUser = User.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }
    return updatedUser;
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.holedo.com/rest/users/access_token/InValidate',
        queryParameters: {'apikey': AuthData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<LoginApiResponse> apiCallLogin(Map<String, dynamic> param) async {
    var url = Uri.parse('https://api.holedo.com/rest/users/login');

    var response = await http.post(url, body: param);
    var data;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return LoginApiResponse(
        token: data['token'],
        error: data['error'],
      );
    }
    return data;
  }
}

class LoginApiResponse {
  final String? token;
  final String? error;

  LoginApiResponse({required this.token, required this.error});
}
