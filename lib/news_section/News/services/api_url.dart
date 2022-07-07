abstract class ApiURLService<T> {
  String newsCategoryURL(String page) {
    String url = 'https://api.holedo.com/rest/articles/index';
    return url;
  }

  String getNewsDataURL(String id) {
    String url = 'https://api.holedo.com/rest/articles/get?id=${id}';
    return url;
  }
}

class ApiBaseURl {
  // final String productImageBaseURL = 'https://quicdeal.in/realestate/files/';
}
