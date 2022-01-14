import 'package:flutter/material.dart';
import 'package:news_app/components/news_card_widget.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portugal'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          NewsCard(),
          NewsCard(),
          NewsCard(),
        ],
      ),
    );
  }
}