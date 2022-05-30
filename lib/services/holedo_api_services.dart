import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Store;
import 'package:get_storage/get_storage.dart';
import 'package:holedo/controller/auth_controller.dart';
import '../models/HoledoProfileModel.dart';
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

  // Future<HoledoProfileModel> getUserProfileData() async {
  //   try {
  //     Response response = await _dio.get(
  //       'https://${AuthData.apiHost}/rest/users/me',
  //       queryParameters: {'apikey': AuthData.apiKey},
  //       options: Options(
  //         headers: <String, dynamic>{
  //           'AuthApi': 'Bearer ${AuthData.token}',
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'Accept': 'application/json',
  //         },
  //       ),
  //     );
  //
  //     // return response.data;
  //     if (response.statusCode == 200) {
  //       final model = Store.Get.put(AuthController()).restoreModel();
  //       model.setData = HoledoProfileModel.fromJson(response.data);
  //       Store.Get.find<AuthController>().authModel(model);
  //
  //       return model.data;
  //     } else {
  //       return HoledoProfileModel.fromJson(response.data);
  //     }
  //   } on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }

  // Future<HoledoProfileModel> updateUserProfile({
  //   required Map<String, dynamic> profileData,
  // }) async {
  //   try {
  //     Response response = await _dio.post(
  //       'https://${AuthData.apiHost}/rest/users/update',
  //       data: jsonEncode(profileData),
  //       queryParameters: {'apikey': AuthData.apiKey},
  //       options: Options(
  //         headers: {'AuthApi': 'Bearer ${AuthData.token}'},
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       final model = Store.Get.put(AuthController()).restoreModel();
  //       model.setData = HoledoProfileModel.fromJson(jsonDecode(response.data));
  //       Store.Get.find<AuthController>().authModel(model);
  //       return model.data;
  //     } else {
  //       throw Exception('Failed to update album.');
  //     }
  //   } on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }

  /// Api fetch and update by Http Start ///

  Future<HoledoProfileModel> getUserProfileData() async {
    try {
      final response = await http.get(
          Uri.parse('https://${AuthData.apiHost}/rest/users/me'),
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
      );
      if (response.statusCode == 200) {
        final model = Store.Get.put(AuthController()).restoreModel();
        model.setData = HoledoProfileModel.fromJson(jsonDecode(response.body));
        Store.Get.find<AuthController>().authModel(model);
        return model.data;
      } else {
        throw Exception('Failed to update album.');
      }
    } catch (SocketException) {
      return Future.error('Error Fetching Data !');
    }
  }

  /// Api fetch and update by Http End ///

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
