import 'package:http/http.dart' as http;

class ApiServices {
  static const baseUrl = "https://gnews.io/api/v4/";

  Future<http.Response> getNews({required String path}) {
    var res;
    try {
      res = http.get(Uri.parse(baseUrl + path));
    } catch (e) {
      print(e);
    }

    return res;
  }
}
