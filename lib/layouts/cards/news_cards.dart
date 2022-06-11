import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/models/models.dart';
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
      child: SizedBox(
        height: 250,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 2),
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
    return InkWell(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(category.slug as String)
            : '/category/${category.slug}/');
      },
      child: Text(
        category.title as String,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class NewsSliderCard extends StatelessWidget {
  final Article data;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const NewsSliderCard({
    Key? key,
    required this.data,
    this.showReleaseDate = true,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('dd MMMM y • h:m');

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Routemaster.of(context).push(pathBuilder != null
              ? pathBuilder!(data.slug as String)
              : '/article/${data.articleCategories!.first.slug}/${data.slug}');
        },
        child: Container(
          height: Get.height * 0.05,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data.bannerImage.toString()),
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                width: Get.width,
                left: Get.width * 0.05,
                bottom: Get.width * 0.02,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title.toString(),
                      style: FontTextStyle.kWhite12W700SSP,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.title.toString(),
                      style: FontTextStyle.kWhite36W400SSP,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'By: ${data.user!.fullName.toString()} • ${_formatter.format(data.created as DateTime)} ',
                      style: FontTextStyle.kWhite14W400SSP,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
