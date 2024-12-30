import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_frist_task/data/models/article_model.dart';

class ArticleRepository {
  Future<List<ArticleModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=23bb8c881ec4468d9dac83164f0f22a4'));

    var data = jsonDecode(response.body);

    List<ArticleModel> articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel artcileModel = ArticleModel.fromJson(item);
        articleModelList.add(artcileModel);
      }
      return articleModelList;
    } else {
      return articleModelList; // empty list
    }
  }
}
