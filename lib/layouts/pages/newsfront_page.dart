import 'package:carousel_slider/carousel_controller.dart';
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
                child: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.3),
                  unselectedLabelColor: ColorPicker.kGreyLight7,
                  labelColor: ColorPicker.kBlueLight1,
                  indicatorWeight: 6,
                  controller: tabState.controller,
                  physics: NeverScrollableScrollPhysics(),
                  labelStyle: FontTextStyle.kBlueLight114W600SSP,
                  tabs: [
                    for (final category in Get.put(HoledoDatabase())
                        .articleCategories
                        .where((category) => category.menuItem == true))
                      Tab(text: category.title),
                    //Tab(icon: Icon(Icons.list), text: 'All News'),
                    //Tab(icon: Icon(Icons.star), text: 'Featured'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabState.controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            for (var i = 0;
                i <
                    Get.put(HoledoDatabase())
                        .articleCategories
                        .where((category) => category.menuItem == true)
                        .length;
                i++)
              PageStackNavigator(stack: tabState.stacks[i]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build2(BuildContext context) {
    final tabState = TabPage.of(context);

    return PageScaffold(
      title: 'Newsfronts',
      body: ListView(
        children: [
          /*Wrap(
            children: [
              //for (final book in Get.put(HoledoDatabase()).books)
              //  BookCard(book: book),
              for (final category in Get.put(HoledoDatabase())
                  .articleCategories
                  .where((category) => category.menuItem == true))
                NewsCategoryCard(category: category),
            ],
          ),*/

          Container(
            color: Color(0xff202f3f),
            height: 70,
            child: TabBar(
              indicatorWeight: 6,
              controller: tabState.controller,
              tabs: [
                for (final category in Get.put(HoledoDatabase())
                    .articleCategories
                    .where((category) => category.menuItem == true))
                  Tab(text: category.title),
                //Tab(icon: Icon(Icons.list), text: 'All News'),
                //Tab(icon: Icon(Icons.star), text: 'Featured'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabState.controller,
              children: <Widget>[
                for (var i = 0;
                    i <
                        Get.put(HoledoDatabase())
                            .articleCategories
                            .where((category) => category.menuItem == true)
                            .length;
                    i++)
                  PageStackNavigator(stack: tabState.stacks[i]),
              ],
            ),
          ),
        ],
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
    print('test: article ${category?.slug}');
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: (!isMobile) ? Get.width * 0.55 : Get.width - 20,
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.03,
                    ),
                    Expanded(
                        child: FutureBuilder(
                            future: Get.put(HoledoDatabase().news)
                                .fetchArticles(
                                    context: context,
                                    type: mode,
                                    category: category?.slug),
                            builder: (context,
                                AsyncSnapshot<List<Article>> snapshot) {
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

                                  //TileBuilder: (index) => StaggeredTile.fit(1),
                                );
                            })),
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
    );
  }
}
