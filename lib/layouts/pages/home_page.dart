import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/main.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List data = [
    {
      'img': 'assets/images/t1.png',
      'text1':
          'Mantra Group Reports Total Revenue Increase of 9.7% for Year Ending June 2015',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t2.png',
      'text1':
          'How Technology Can Deliver a Seamless Travel Experience - Information Age',
      'text2': 'MEMBERS ONLY',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t3.png',
      'text1': 'Baha Mar Files Chapter 11 Plan of Reorganization',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t4.png',
      'text1': 'The Quincy Hotel in Downtown Washington D.C. Sold to RLHC JV',
      'text2': 'MEMBERS ONLY',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t5.png',
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t5.png',
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t6.png',
      'text1':
          'Hotel Price Index Reveals Midwest, Southwest and Western Cities Are Surging Domestically',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t7.png',
      'text1': 'MainStay Suites Hotel Sydney Opens in Montana',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t8.png',
      'text1': 'California raisin’ prices as deal volume drops',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t9.png',
      'text1': 'Hotel Industry Opposes NLRB Joint-Employer Decision',
      'text2': 'MEMBERS ONLY',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
  ];
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    final newsController = holedoDatabase.news;
    final featuredNews =
        newsController.fetchArticles(context: context, type: 'featured');
    return PageScaffold(
      title: 'Home Page',
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                height: Get.height * 0.50,
                width: Get.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(() {
                      if (newsController.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else {
                        if (newsController.dataList.isEmpty)
                          return Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text('No results found'),
                          );
                        else
                          return CarouselSlider.builder(
                              itemCount: newsController.dataList.length,
                              options: CarouselOptions(
                                height: Get.height * 0.50,
                                viewportFraction: 1.0,
                                initialPage: 1,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: false,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              ),
                              carouselController: buttonCarouselController,
                              itemBuilder: (BuildContext context, int i,
                                      int pageViewIndex) =>
                                  NewsSliderCard(
                                      data: newsController.dataList[i]
                                          as Article));
                      }
                    }),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: ColorPicker.kBlueDark1.withOpacity(0.4),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              // Use the controller to change the current page
                              buttonCarouselController.previousPage();
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              size: 21,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: ColorPicker.kGreyLight5.withOpacity(0.4),
                        child: Center(
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                // Use the controller to change the current page
                                buttonCarouselController.nextPage();
                              },
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 21,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                // margin:
                //     EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                height: Get.height * 0.06,
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFBDC4C7), width: 2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final category in Get.put(HoledoDatabase())
                        .articleCategories
                        .where((category) => category.menuItem == true))
                      NavigationBox(
                        title: category.title.toString(),
                        path: '/news/${category.slug}',
                        inDrawer: false,
                      ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
