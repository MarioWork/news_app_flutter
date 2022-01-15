import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:share_plus/share_plus.dart';

import 'custom_progress_indicator.dart';

class NewsCardWidget extends StatefulWidget {
  final NewsArticleModel article;

  const NewsCardWidget({Key? key, required this.article}) : super(key: key);

  @override
  _NewsCardWidgetState createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends State<NewsCardWidget> {



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.white30,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.article.articleImageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => const CustomProgressIndicatorWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  child: Text(
                    widget.article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,5),
                      child: Text(widget.article.publishDate),
                    )),
                    SizedBox(
                      height: 20,
                      child: IconButton(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        iconSize: 15,
                        onPressed: () {
                          Share.share(widget.article.originalArticleUrl,
                              subject: widget.article.title);
                        },
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
