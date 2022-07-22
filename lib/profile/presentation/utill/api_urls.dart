class AppUrls {
  static const apiHost = 'api.holedo.com';
  static const apiKey = 'Holedo_flutter_tests';
  static const device = 'Holedo_Flutter';
  static const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM2MDgsImV4cCI6MTk2NzU1MDk5MH0.TTXGrAWbFkpMgjzzh2kly0RqyLxc_NzPIlyr7nzvc_I';
  static const baseUrl = 'https://api.holedo.com/rest';
  static const contentType = "application/json; charset=UTF-8";
  static const acceptType = "application/json";
  static const Map<String, dynamic> defaultHeaders = <String, dynamic>{
    'AuthApi': 'Bearer $token',
    'Content-Type': contentType,
    'Accept': acceptType,
    'Device': device,
  };

  static Map<String, dynamic> defaultHeadersCustomToken(String token) =>
      <String, dynamic>{
        'AuthApi': 'Bearer $token',
        'Content-Type': contentType,
        'Accept': acceptType,
        'Device': device,
      };
}
