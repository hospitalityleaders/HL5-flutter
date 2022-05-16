import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/userProfileModel.dart';

class UserProfileService {
  static Future<UserProfileModel> getUserApi([String? token]) async {
    var uri = 'https://api.holedo.com/rest/users/me';
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM2MDgsImV4cCI6MTk2NzY5NDExOH0.1QJgDDgRm-GmQ-nHcAUDrFmaBSoLJWcDaum6_kj9m-8';

    final response = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'AuthApi': 'Bearer $token'
    });
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(data);
    } else {
      return UserProfileModel.fromJson(data);
    }
  }

  static Future<UserProfileModel> updateUserProfileSummary(String firstName,String token) async {
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM2MDgsImV4cCI6MTk2NzY5NDExOH0.1QJgDDgRm-GmQ-nHcAUDrFmaBSoLJWcDaum6_kj9m-8';

    var response = await http.put(
      Uri.parse('https://api.holedo.com/rest/users/me'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'AuthApi': 'Bearer $token'
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
