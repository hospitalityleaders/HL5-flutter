import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/layouts/pages/news/update/update_news2.dart';
import 'package:holedo/main.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/mobile_slide_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    //final newsController = holedoDatabase.news;
    //final featuredNews =
    //  newsController.fetchArticles(context: context, type: 'featured');

    final categories = Get.put(HoledoDatabase())
        .articleCategories
        .where((category) => category.menuItem == true);

    return const PageScaffold(
      title: 'Home Page',
      body: UpdateNewsSecond(),
    );
  }

  @override
  Widget build2(BuildContext context) {
    final newsController = holedoDatabase.news;
    final featuredNews =
        newsController.fetchArticles(context: context, type: 'featured');

    final categories = Get.put(HoledoDatabase())
        .articleCategories
        .where((category) => category.menuItem == true);

    return PageScaffold(
      title: 'Home Page',
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: SizedBox(
                height: Get.height * 0.50,
                width: Get.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(() {
                      if (newsController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (newsController.dataList.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(30),
                            child: Text('No results found'),
                          );
                        } else {
                          return CarouselSlider.builder(
                            itemCount: newsController.dataList.length,
                            options: CarouselOptions(
                              height: Get.height * 0.50,
                              viewportFraction: 1.0,
                              initialPage: 1,
                              autoPlayInterval: const Duration(seconds: 3),
                              enlargeCenterPage: true,
                            ),
                            carouselController: buttonCarouselController,
                            itemBuilder: (
                              BuildContext context,
                              int i,
                              int pageViewIndex,
                            ) =>
                                NewsSliderCard(
                              data: newsController.dataList[i] as Article,
                            ),
                          );
                        }
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
                            icon: const Icon(
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
                              icon: const Icon(
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
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFBDC4C7), width: 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final category in categories)
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
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: Get.put(HoledoDatabase().news)
                              .fetchArticles(context: context),
                          builder:
                              (context, AsyncSnapshot<List<Article>> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return CustomScrollView(
                                slivers: <Widget>[
                                  SliverGrid(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        return NewsSingleCard(
                                          article: snapshot.data![index],
                                          showReleaseDate: true,
                                        );
                                      },
                                      childCount: snapshot.data!.length,
                                    ),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      childAspectRatio: 2.0,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.01,
                ),
                const NewsRightColumn()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
