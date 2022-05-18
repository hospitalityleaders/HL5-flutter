import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:holedo/controller/auth_controller.dart';
import 'package:http/http.dart' as http;
import '../models/userProfileModel.dart';

final userData = GetStorage();

class UserProfileService {
  static Future<UserProfileModel> getUserApi() async {
    var uri = 'https://api.holedo.com/rest/users/me';

    final response = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'AuthApi': 'Bearer ${userData.read('token')}'
    });
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(data);
    } else {
      return UserProfileModel.fromJson(data);
    }
  }

  static Future<UserProfileModel> updateUserProfileSummary(
    String firstName,
  ) async {
    var response = await http.put(
      Uri.parse('https://api.holedo.com/rest/users/me'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'AuthApi': 'Bearer ${userData.read('token')}'
      },
      body: jsonEncode(<String, String>{
        'first_name': firstName.toString(),
      }),
    );

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }
}
