import 'package:flutter/material.dart';
import 'package:news_app/screens/news_feed_screen/news_feed_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const NewsFeedScreen(),
    );
  }
}



