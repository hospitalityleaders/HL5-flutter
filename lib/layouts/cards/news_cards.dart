import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

import 'holedo_cards.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const NewsCard({
    Key? key,
    required this.article,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(article.slug as String)
            : '/article/${article.articleCategories?.first.slug}/${article.slug}');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.bannerImage.toString()),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            height: 100,
            width: 75,
            child: article.bannerImage != null
                ? null
                : Icon(
                    CupertinoIcons.news,
                    size: 55,
                    color: Colors.grey,
                  ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title as String,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text('------------------'),
                for (final cat in article.articleCategories!)
                  Text(
                    cat.title as String,
                    style: TextStyle(fontSize: 12),
                  ),
                if (showReleaseDate)
                  Text(_formatter.format(article.created as DateTime)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsCategoryCard extends StatelessWidget {
  final ArticleCategory category;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const NewsCategoryCard({
    Key? key,
    required this.category,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return SmallCard(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(category.slug as String)
            : '/category/${category.slug}/');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(3),
            ),
            height: 30,
            width: 25,
            child: Icon(
              CupertinoIcons.news,
              size: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title as String,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
