import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:holedo/news_section/News/api/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

enum APIType {
  aPost,
  aGet,
}

class APIService {
  var response;

  @override
  Future getResponse(
      {@required String? url,
      @required APIType? apitype,
      Map<String, dynamic>? body,
      bool fileUpload = false}) async {
    // Map<String, String> header = {
    //   "Authorization": "Bearer ${await SharedPrefs().getAuthorizationKey()}",
    //   //"Content-Type": "application/json"
    // };

    try {
      if (apitype == APIType.aGet) {
        final result = await http.get(Uri.parse(url!));
        response = returnResponse(result.statusCode, result.body);
        print("REQUEST PARAMETER url  $url");
        // log("res : ${result.body}");
      } else if (fileUpload) {
        print("REQUEST PARAMETER url  $url");
        dio.FormData formData = new dio.FormData.fromMap(body!);

        dio.Response result =
            await dio.Dio().post(url!, data: formData, options: dio.Options());

        response = returnResponse(result.statusCode!, jsonEncode(result.data));
        print("response......$response");
      } else {
        print("REQUEST PARAMETER url  $url");
        print("REQUEST PARAMETER $body");
        // print("REQUEST header $header");

        final result = await http.post(
          Uri.parse(url!),
          body: body,
          // headers: header,
        );
        log("resp${result.body}");
        response = returnResponse(result.statusCode, result.body);
        print(result.statusCode);
      }
    } on SocketException {
      throw FetchDataException('No Internet access');
    }

    return response;
  }

  returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 201:
        return jsonDecode(result);
      case 400:
        return jsonDecode(result);
      // throw BadRequestException('Bad Request');

      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}
// ///error
// {
// "user": {
// "first_name": "",
// "last_name": "",
// "email": "",
// "username": "",
// "extended_user": {
// "mobile_number": "",
// "cls": "",
// "school_name": "",
// "school_address": "",
// "school_state": "",
// "school_city": ""
// }
// },
// "token": "",
// "msg": "{'username': [ErrorDetail(string='A user with that username already exists.', code='unique')]}"
// }
// ///sucess
// {
// "user": {
// "first_name": "hina",
// "last_name": "patel",
// "email": "hina@gmail.com",
// "username": "hina1@1234",
// "extended_user": {
// "mobile_number": "8784984458",
// "cls": 5,
// "school_name": "Svs",
// "school_address": "surat",
// "school_state": "gujrat",
// "school_city": "surat"
// }
// },
// "token": "e8358c4b07a8622bf913e152a7ee76461f08d27d",
// "msg": "Successfully Created User"
// }
//
// {
// "client_key": "1595922666X5f1fd8bb5f662",
// "device_type": "MOB",
// "fname": "abc",
// "lname": "abc",
// "email": "abc@gmail.com",
// "mobile": "1235666589",
// "dob": "2021-07-06",
// "password": "12345678",
// "confirm_password": "12345678"
// }
