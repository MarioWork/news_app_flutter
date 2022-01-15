import 'dart:convert';
import 'package:news_app/models/news_article_model.dart';
import 'package:http/http.dart' as http;

class NewsArticleService {
  //
  Future<List<NewsArticleModel>> getArticles(int page) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=pt&page=$page&apiKey=a20fafee3a134b5a88cba13bc1e8eeeb'));

    if (response.statusCode == 200) {
      return json
          .decode(response.body)['articles']
          .map<NewsArticleModel>(
              (element) => NewsArticleModel.fromJson(element))
          .toList();
    }

    throw Exception('Failed to load articles');
  }
}
