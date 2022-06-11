import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/responsive/responsive.dart';
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

class NewsSingleCard extends StatelessWidget {
  final Article article;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const NewsSingleCard({
    Key? key,
    required this.article,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          Routemaster.of(context).push(pathBuilder != null
              ? pathBuilder!(article.slug as String)
              : '/article/${article.articleCategories?.first.slug}/${article.slug}');
        },
        child: Container(
          height: (isMobile ? Get.width * .40 : 500),
          color: ColorPicker.kWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (isMobile ? (Get.width * .40) * .48 : 500 * .70),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.bannerImage.toString()),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    repeat: ImageRepeat.noRepeat,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              SizedBox(height: 4),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.articleCategories!.first.title.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        article.title.toString(),
                        style: isMobile
                            ? FontTextStyle.kBlackPure20W400PR
                            : FontTextStyle.kBlackPure30W400PR,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'By: ${article.user!.fullName.toString()} • ${_formatter.format(article.created as DateTime)} ',
                        style: FontTextStyle.kBlueDark114W400SSP,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

class NewsRightColumn extends StatelessWidget {
  final String Function(String id)? pathBuilder;

  const NewsRightColumn({
    Key? key,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('dd MMMM y • h:m');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Routemaster.of(context).push(pathBuilder != null
        // ? pathBuilder!(data.slug as String)
        //  : '/article/${data.articleCategories!.first.slug}/${data.slug}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.035,
          ),
          Container(
            //height: 1050,
            width: 373,
            color: ColorPicker.kPrimaryLight,
            child: Stack(
              children: [
                Positioned(
                  top: -1,
                  left: 0,
                  child: Container(
                    // height: Get.height * 0.3,
                    width: 100,
                    child: Image(
                        image: AssetImage('assets/images/round.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: Get.width * 0.025),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicWidth(
                            child: Column(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.apartment_rounded,
                                  color: Color(0xFF546088),
                                ),
                                Container(
                                  width: 2,
                                  height: 150,
                                  color: Color(0xFF546088),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: 30),
                              Text(
                                'SIGN UP TO JOIN',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  'Get priority news access',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 36,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color(0xFF546088),
                              ),
                              Container(
                                width: 2,
                                height: Get.height * 0.078,
                                color: Color(0xFF546088),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All the latest news',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  'Stay up to date with news from the tourism and hospitality industry.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color(0xFF546088),
                              ),
                              Container(
                                width: 2,
                                height: Get.height * 0.078,
                                color: Color(0xFF546088),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Credible sources',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  'I’ts gathered from hundreds of trusted sources and updates in real time.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Color(0xFF546088),
                              ),
                              Container(
                                width: 2,
                                height: Get.height * 0.078,
                                color: Color(0xFF546088),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Wide scope of research',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 24),
                              Container(
                                width: 2,
                                height: Get.height * 0.078,
                                color: Color(0xFF546088),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Container(
                              height: 36,
                              width: 248,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person_add, size: 15),
                                    Text(
                                      'Sign up now. It’s free',
                                      style: TextStyle(
                                        color: Color(0xFF272E41),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.download_rounded,
                                color: Color(0xFF546088),
                              ),
                              // Container(
                              //   width: 2,
                              //   height: Get.height * 0.01,
                              //   color: Color(0xFF546088),
                              // ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  'OR IMPORT YOUR DETAILS FROM',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 24),
                              Container(
                                width: 2,
                                height: Get.height * 0.078,
                                color: Color(0xFF546088),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: Get.width * 0.15,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 36,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF344F8D),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image:
                                            AssetImage('assets/icons/fb.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  child: Container(
                                    height: 36,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD63B30),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image:
                                            AssetImage('assets/icons/gp.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  child: Container(
                                    height: 36,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF04595B),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage('assets/icons/x.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 280,
            width: 373,
            child: Center(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/Bannerimage.png'),
              ),
            ),
          ),
          SizedBox(
            height: 125,
          ),
        ],
      ),
    );
  }
}
