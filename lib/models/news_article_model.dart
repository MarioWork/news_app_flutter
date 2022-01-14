import 'package:intl/intl.dart';

class NewsArticleModel {
  String title;
  String description;
  String originalArticleUrl;
  String articleImageUrl;
  String publishDate;

  NewsArticleModel(
      {required this.title,
      required this.description,
      required this.originalArticleUrl,
      required this.articleImageUrl,
      required this.publishDate});

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
        title: json['title'],
        description: json['description'],
        originalArticleUrl: json['url'],
        articleImageUrl: json['urlToImage'],
        publishDate: DateFormat("dd-MM-yyyy")
            .format(DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(json['publishedAt'])));
  }
}
