import 'package:flutter/material.dart';
import 'package:news_app/components/news_card_widget.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/services/news_article_service.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  Future<List<NewsArticleModel>> _setupArticles() async {
    List<NewsArticleModel> articles = await NewsArticleService().getArticles(1);
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portugal'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<NewsArticleModel>>(
        future: _setupArticles(),
        builder: (context, future) {
          if (!future.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              ],
            );
          } else {
            List<NewsArticleModel>? list = future.data;
            return ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return NewsCardWidget(article: list![index]);
              },
            );
          }
        },
      ),
    );
  }
}
