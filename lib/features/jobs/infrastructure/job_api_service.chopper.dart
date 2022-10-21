// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$JobAPIService extends JobAPIService {
  _$JobAPIService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = JobAPIService;

  @override
  Future<Response<dynamic>> getPremiumJobs(int page) {
    final String $url =
        'https://api.holedo.com/rest/jobs/search?page=${page}&limit=16&type=Premium';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getJob(int id) {
    final String $url = 'https://api.holedo.com/rest/jobs/get?id=${id}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchJob(
    int page,
    String location,
  ) {
    final String $url =
        'https://api.holedo.com/rest/jobs/search?page=${page}&limit=16&location=${location}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
