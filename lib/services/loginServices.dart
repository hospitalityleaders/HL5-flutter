import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
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
