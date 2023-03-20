import 'dart:convert';

import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/network/api_services.dart';

class Repository {
  ApiServices apiServices = ApiServices();
  Future<NewsModel> getNews({required String path}) async {
    print("Repo: Call");
    final callApi = await apiServices.getNews(path: path);

    String callAPiToString = callApi.body.toString();
    var jsonDecodeRes = json.decode(callAPiToString);

    return NewsModel.fromJson(jsonDecodeRes);
  }

  Future<NewsModel> getTopHeadlines({required String path}) async {
    print("Repo: Call");
    final callApi = await apiServices.getNews(path: path);

    return NewsModel.fromJson(json.decode(callApi.body.toString()));
  }
}
