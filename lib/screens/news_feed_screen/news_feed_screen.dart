import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/components/custom_progress_indicator_widget.dart';
import 'package:news_app/components/news_card_widget.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/services/news_article_service.dart';

import 'components.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final int _pageSize = 20;

  final PagingController<int, NewsArticleModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _getArticles(pageKey);
    });
    super.initState();
  }

  Future<List<NewsArticleModel>> _getArticles(int pageKey) async {
    List<NewsArticleModel> articles =
        await NewsArticleService().getArticles(pageKey);
    final isLastPage = articles.length < _pageSize;

    if (isLastPage) {
      _pagingController.appendLastPage(articles);
    } else {
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(articles, nextPageKey);
    }

    return articles;
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarContent(),
        body: PagedListView<int, NewsArticleModel>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<NewsArticleModel>(
              itemBuilder: (context, item, index) => NewsCardWidget(
                    article: item,
                  ),
              firstPageProgressIndicatorBuilder: (_) =>
                  const CustomProgressIndicatorWidget(),
              newPageProgressIndicatorBuilder: (_) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomProgressIndicatorWidget(),
                  ),
              noMoreItemsIndicatorBuilder: (_) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('No more articles to show')),
                  )),
        ));
  }
}


