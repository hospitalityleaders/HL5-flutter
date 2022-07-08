import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/services/holedo_api_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

dio.Dio _dio = dio.Dio();
Future<void> main() async {
  final token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM4MjksImV4cCI6MTk3MTI0Mzc1NH0.iD6C9KbsPNit4xmBEby-iighMVcrilS-xlsNcpUwdOM";

  ApiServices apiServices = ApiServices();

  final response = await http.post(
      Uri.parse("https://api.holedo.com/site-settings/v2?type=2"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  // print('Token : ${token}');
  // print(response);
  // final response = await apiServices.POST(
  //     target: "https://api.holedo.com/site-settings/v2?type=2");
  // await getSettings();
  print("response is ${response.toString()}");
  //
}

Future<Holedoapi> getSettings() async {
  try {
    var data = new Holedoapi();
    var url = "${baseUrl}" + "/site-settings/v2?type=2";
    dio.Response response = await _dio.get(url);
    print('URL: ${url}');
    if (response.statusCode == 200 && response.data['success'] == true) {
      data = Holedoapi.fromJson(response.data as Map<String, dynamic>);
    }
    return data;
  } catch (e) {
    throw Exception(e.toString());
  }
}
