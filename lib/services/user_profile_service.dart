import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/userProfileModel.dart';

class UserProfileService{
  static Future<UserProfileModel> getUserApi() async {
    var uri = 'https://api.holedo.com/rest/users/me';
    var token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQyODAsImV4cCI6MTk2NjQxMTI0NH0.umSFTSYjB9XCv6AHHfeOIpG-v0foRHwoaM2MnBgTDpw";

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

}