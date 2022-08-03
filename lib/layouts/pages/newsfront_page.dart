import 'package:carousel_slider/carousel_slider.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:holedo/main.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:routemaster/routemaster.dart';
import 'package:holedo/models/models.dart';

class NewsfrontPage extends StatelessWidget {
  const NewsfrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    final tabState = TabPage.of(context);
    final newsController = holedoDatabase.news;
    final bool isMobile = Responsive.isMobile(context);
    final bool isDesktop = Responsive.isDesktop(context);
    final featuredNews =
        newsController.fetchArticles(context: context, type: 'featured');
    final tabs = Get.put(HoledoDatabase())
        .articleCategories
        .where((category) => category.menuItem == true);
    return PageScaffold(
      title: 'Home Page',
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                height: isMobile ? 190 : 491,
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
                                height: isMobile ? 190 : 491,
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
            // ..SliverToBoxAdapter(
            //   child:
            // ),
          ];
        },
        body: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            backgroundColor: ColorPicker.kBG,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(46),
              child: Container(
                height: 46,
                width: Get.width,
                decoration: BoxDecoration(
                    color: ColorPicker.kWhite,
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFBDC4C7), width: 2))),
                child: TabBar(
                  padding: EdgeInsets.all(
                      0.02), // fromWindowPadding(Get.window.padding, .2),
                  unselectedLabelColor: ColorPicker.kGreyLight7,
                  labelColor: ColorPicker.kBlueLight1,
                  indicatorWeight: 6,
                  controller: tabState.controller,
                  physics: NeverScrollableScrollPhysics(),
                  labelStyle: FontTextStyle.kBlueLight114W600SSP,
                  tabs: [
                    for (final category in tabs) Tab(text: category.title),
                  ],
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Get.height + 500,
                      width: (!isMobile) ? Get.width * 0.55 : Get.width - 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.033,
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabState.controller,
                              children: <Widget>[
                                for (var i = 0; i < tabs.length; i++)
                                  PageStackNavigator(stack: tabState.stacks[i]),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    if (!isMobile)
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                    if (!isMobile) NewsRightColumn()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewsfrontListPage extends StatelessWidget {
  final String mode;
  final ArticleCategory? category;

  const NewsfrontListPage({
    Key? key,
    required this.mode,
    this.category,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final articles = HoledoDatabase().articles(slug: mode);
    // final NewsController controller = Get.put(HoledoDatabase().news);
    //newsController.fetchArticles(category: mode);
    final bool isMobile = Responsive.isMobile(context);

    return FutureBuilder(
      future: Get.put(HoledoDatabase().news).fetchArticles(
          context: context, type: mode, category: category?.slug),
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return CustomScrollView(
            slivers: <Widget>[
              SliverAlignedGrid.count(
                crossAxisCount: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return NewsSingleCard(
                      article: snapshot.data![index], showReleaseDate: true);
                },
              ),
            ],
          );
      },
    );
  }

  @override
  Widget build3(BuildContext context) {
    //final articles = HoledoDatabase().articles(slug: mode);
    // final NewsController controller = Get.put(HoledoDatabase().news);
    //newsController.fetchArticles(category: mode);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: (!isMobile) ? Get.width * 0.55 : Get.width - 20,
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.02,
                  ),
                  CustomScrollView(
                    slivers: [
                      FutureBuilder(
                        future: Get.put(HoledoDatabase().news).fetchArticles(
                            context: context,
                            type: mode,
                            category: category?.slug),
                        builder:
                            (context, AsyncSnapshot<List<Article>> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else
                            return AlignedGridView.count(
                              crossAxisCount: 1,
                              itemCount: snapshot.data!.length,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              itemBuilder: (context, index) {
                                return NewsSingleCard(
                                    article: snapshot.data![index],
                                    showReleaseDate: true);
                              },
                            );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (!isMobile)
              SizedBox(
                width: Get.width * 0.01,
              ),
            if (!isMobile) NewsRightColumn(),
          ],
        ),
      ),
    );
  }
}
