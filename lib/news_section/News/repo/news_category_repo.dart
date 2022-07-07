import 'dart:convert';

import 'package:holedo/models/models.dart';
import 'package:holedo/news_section/News/response_model/news_category_response_model.dart';
import 'package:holedo/news_section/News/services/api_service.dart';
import 'package:holedo/news_section/News/services/api_url.dart';

class NewsCategoryRepo extends ApiURLService {
  Future<NewsCategoryResponseModel> newsCategoryRepo(String page) async {
    var response = await APIService()
        .getResponse(url: newsCategoryURL(page), apitype: APIType.aGet);

    // print('RESPONSE:-$response');

    NewsCategoryResponseModel newsCategoryResponseModel =
        NewsCategoryResponseModel.fromJson(response as Map<String, dynamic>);
    print('RESPONSE11111111111:-${newsCategoryResponseModel.data}');
    return newsCategoryResponseModel;
  }
}
