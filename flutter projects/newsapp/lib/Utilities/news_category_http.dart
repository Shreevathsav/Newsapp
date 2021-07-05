import 'dart:convert';

import 'package:newsapp/DataModels/newsData.dart';
import 'package:http/http.dart' as http;

class NewsCategory {
  List<NewsData> newsData = [];

  Future<void> getNewsCategoryArticles(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=777bf8388c6b47c484441e6acc9f1d4f";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          NewsData news = NewsData(
              title: element['title'],
              author: element['author'],
              url: element["url"],
              description: element["description"],
              urlImage: element["urlToImage"],
              content: element["content"]);
          newsData.add(news);
        }
      });
    }
  }
}
