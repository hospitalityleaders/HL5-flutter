import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holedo/common/pref_manager.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/main.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/news_section/News/api/news_category_view_model.dart';
import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/header.dart';
import 'package:holedo/services/holedo_api_services.dart';

import 'package:jiffy/jiffy.dart';
import 'package:loadmore/loadmore.dart';
import 'package:routemaster/routemaster.dart';
import '../../../constant/colorPicker/color_picker.dart';
import '../../../constant/fontStyle/font_style.dart';
import '../../../constant/sizedbox.dart';
import '../../../controller/menu_controller.dart';
import '../../../models/holedoapi/article.dart';
import '../../../responsive/responsive.dart';
import '../NewsSingle/news_single_logged_in.dart';

class NewsCategory extends StatefulWidget {
  @override
  _NewsSignalScreenState createState() => _NewsSignalScreenState();
}

class _NewsSignalScreenState extends State<NewsCategory>
    with SingleTickerProviderStateMixin {
  CarouselController buttonCarouselController = CarouselController();
  // ScrollController _scrollController = ScrollController();
  var _scrollController = ScrollController();

  // ScrollController _scrollController = ScrollController();
  MenuController _controller = Get.put(MenuController());

  TabController? _tabController;
  bool dataUpdate = false;
  bool circularBool = false;
  int tabBar = 0;
  int indexCircle = 0;
  UniqueKey uniqueKey = UniqueKey();
  var isLoading = true.obs;
  final ApiServices _api = ApiServices();
  var dataList = [].obs;
  var article = Article().obs;
  List<Article> articleList = [];
  var page = 1;
  var limit = 10;
  int get count => articleList.length;
  Future<List<Article>> fetchArticles1(
      {String? category,
      String? keyword,
      String? type,
      required int? limit,
      required int? page,
      required BuildContext context}) async {
    try {
      isLoading(true);
      var params = {
        'category': category,
        'type': type,
        'keyword': keyword,
        'limit': limit == null ? this.limit : limit,
        'page': page == null ? this.page : page
      };
      params.removeWhere((k, v) => v == null);

      print('context: ${context} type: ${type} cat: ${category}');
      var response = await _api.GET(target: '/articles/index', data: params);

      if (response.success == true) {
        var list = response.data!.articles as List<Article>;
        dataList.value = list;

        //print('log: ${list}');
        for (final data in list) {
          //articleList.add(data);
          // print('c ${data.id} ${(articleList.any((e) => e.id == data.id))}');

          if ((articleList.any((e) => e.id == data.id)) != true) {
            // print('adding ${data.id}');
            articleList.add(data);
          }
        }
        print('localcache: count: ${articleList.length}');
      }
      return dataList.value as List<Article>;
    } finally {
      isLoading(false);
    }
  }

  void load() {
    print("loading------------------");
    setState(() {
      Get.put(HoledoDatabase().news)
          .fetchArticles1(context: context, limit: limit, page: page);
      limit + 10;
      page + 1;
    });
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    print('REFRESH_______');
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
  }

  void initState() {
    _tabController = TabController(length: 5, vsync: this);

    // LandingPage(page: 'NewsCategory');
    newsCategoryViewModel.newsCategoryViewModel('1');
    super.initState();
    /* _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('_scrollController');
          setState(() {
            _future = fetchArticles1(context: context, limit: 10, page: 1);
          });
        } else {
          print('_scrollController bottom');
        }
      }
    });*/
  }

  int pageCount = 0;

  MenuController _menuController = Get.find();
  NewsCategoryViewModel newsCategoryViewModel =
      Get.put(NewsCategoryViewModel());

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final newsController = holedoDatabase.news;
    print(
        'NEWS SLIDER--------------------------${newsController.dataList.length}');
    final featuredNews =
        newsController.fetchArticles(context: context, type: 'featured');
    return Responsive.isDesktop(context)
        ? Material(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(page: 'Newscategory'),
                  Container(
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
                  Container(
                    // margin:
                    //     EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                    height: Get.height * 0.06,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFBDC4C7), width: 2))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final category in Get.put(HoledoDatabase())
                            .articleCategories
                            .where((category) => category.menuItem == true))
                          NavigationBox(
                            title: category.title.toString(),
                            path: '/news1/${category.slug}',
                            inDrawer: false,
                          ),
                      ],
                    ),
                  ),
                  Container(
                    child: FutureBuilder(
                      // future: _future,
                      future: Get.put(HoledoDatabase().news)
                          .fetchArticles(context: context),
                      builder:
                          (context, AsyncSnapshot<List<Article>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width * 0.55,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // print(
                                          //     '----id-setNewsDataId----${controller.newsCategoryListFirstData[0].id.toString()}');
                                          PreferenceManager.setNewsDataId(
                                              snapshot.data![0].id.toString());
                                          print(
                                              '----PreferenceManager.getNewsDataId()---------------${PreferenceManager.getNewsDataId()}');
                                          Routemaster.of(context).push(
                                              '/article/${snapshot.data![0].articleCategories?.first.slug}/${snapshot.data![0].slug}');
                                          /*    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NewsSingleLoggedInScreen()),
                                          );*/
                                          // Get.to(NewsSingleLoggedInScreen());
                                        },
                                        child: Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.symmetric(
                                                vertical: BorderSide(
                                                    color: Colors.white)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Container(
                                                height: Get.height * 0.40,
                                                width: Get.width,
                                                child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      '${snapshot.data![0].bannerImage}'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'RESOURCES',
                                                style: FontTextStyle
                                                    .kGreyLight712W700SSP,
                                              ),
                                              Text(
                                                '${snapshot.data![0].title}',
                                                style: FontTextStyle
                                                    .kBlueDark136W400SSP,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text: "By : ",
                                                        style: FontTextStyle
                                                            .kGreyLight5146W400SSP,
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  "${snapshot.data![0].user!.fullName}  •  ",
                                                              style: FontTextStyle
                                                                  .kGreyLight5146W400SSP),
                                                          TextSpan(
                                                              text:
                                                                  "${Jiffy(snapshot.data![0].created!).format('do MMMM yyyy • h:mm')}",
                                                              style: FontTextStyle
                                                                  .kGreyLight5146W400SSP),
                                                          // TextSpan(
                                                          //     text: "  10:40",
                                                          //     style: FontTextStyle
                                                          //         .kGreyLight5146W400SSP),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.01,
                                                    ),
                                                    VerticalDivider(
                                                      thickness: 1,
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.01,
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/facebook.svg'),
                                                          Text(
                                                            '  • 112',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/twitter.svg'),
                                                          Text('  • 56',
                                                              style: FontTextStyle
                                                                  .kGreyLight5146W400SSP),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/googleplus.svg'),
                                                          Text(
                                                            '  • 321',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          Image.asset(
                                                              'assets/icons/svg/linkdin.png',
                                                              height: 20),
                                                          Text(
                                                            '  • 22',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/any.svg'),
                                                          Text(
                                                            '  • 13',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // print(
                                          //     '----id-setNewsDataId----${controller.newsCategoryListFirstData[1].id.toString()}');
                                          PreferenceManager.setNewsDataId(
                                              snapshot.data![1].id.toString());
                                          print(
                                              '----PreferenceManager.getNewsDataId()---------------${PreferenceManager.getNewsDataId()}');
                                          Routemaster.of(context).push(
                                              '/article/${snapshot.data![1].articleCategories?.first.slug}/${snapshot.data![1].slug}');

                                          // Get.to(NewsSingleLoggedInScreen());
                                        },
                                        child: Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.symmetric(
                                                vertical: BorderSide(
                                                    color: Colors.white)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Container(
                                                height: Get.height * 0.40,
                                                width: Get.width,
                                                child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      '${snapshot.data![1].bannerImage}'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'RESOURCES',
                                                style: FontTextStyle
                                                    .kGreyLight513W700SSP,
                                              ),
                                              Text(
                                                '${snapshot.data![1].title}',
                                                style: FontTextStyle
                                                    .kBlueDark136W400SSP,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text: "By : ",
                                                        style: FontTextStyle
                                                            .kGreyLight5146W400SSP,
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  "${snapshot.data![1].user!.fullName}  •  ",
                                                              style: FontTextStyle
                                                                  .kGreyLight5146W400SSP),
                                                          TextSpan(
                                                              text:
                                                                  "${Jiffy(snapshot.data![1].created!).format('dd MMMM yyyy • h:mm')}",
                                                              style: FontTextStyle
                                                                  .kGreyLight5146W400SSP),
                                                          // TextSpan(
                                                          //     text: "  10:40",
                                                          //     style: FontTextStyle
                                                          //         .kGreyLight5146W400SSP),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.01,
                                                    ),
                                                    VerticalDivider(
                                                      thickness: 1,
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.01,
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/facebook.svg'),
                                                          Text(
                                                            '  • 112',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/twitter.svg'),
                                                          Text(
                                                            '  • 56',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/googleplus.svg'),
                                                          Text(
                                                            '  • 321',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          Image.asset(
                                                              'assets/icons/svg/linkdin.png',
                                                              height: 20),
                                                          Text(
                                                            '  • 22',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.01,
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/icons/svg/any.svg'),
                                                          Text(
                                                            '  • 13',
                                                            style: FontTextStyle
                                                                .kGreyLight5146W400SSP,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),

                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: Get.width /
                                                      (Get.height / 0.75),
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10),
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            // print(
                                            //     'LENGTH:-----: ${controller.newsCategoryList.length}');
                                            // print(
                                            //     'controller.newsCategoryList.length---$index-------${controller.newsCategoryList[index].title}');

                                            // index == 0 || index == 1
                                            //     ? index = 3
                                            //     : index = index;

                                            return GestureDetector(
                                              onTap: () {
                                                print(
                                                    '----id-setNewsDataId----${snapshot.data![index].id.toString()}');

                                                PreferenceManager.setNewsDataId(
                                                    snapshot.data![index].id
                                                        .toString());
                                                print(
                                                    '----PreferenceManager.getNewsDataId()---------------${PreferenceManager.getNewsDataId()}');

                                                Routemaster.of(context).push(
                                                    '/article/${snapshot.data![index].articleCategories?.first.slug}/${snapshot.data![index].slug}');

                                                /*  Get.to(
                                                    NewsSingleLoggedInScreen());*/
                                                // newDataId:
                                                //     '${controller.newsCategoryList[index].id}',
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                width: Get.width * 0.25,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors.white,
                                                          width: 4),
                                                    )),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: Get.height * 0.20,
                                                      width: Get.width,
                                                      child: Image(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              '${snapshot.data![index].bannerImage}')),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        '${snapshot.data![index].title}',
                                                        style: FontTextStyle
                                                            .kBlueDark118W700SSP,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: "By : ",
                                                        style: FontTextStyle
                                                            .kGreyLight514W600PR,
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  "${snapshot.data![index].user!.fullName}  •  ",
                                                              style: FontTextStyle
                                                                  .kGreyLight514W600PR),
                                                          TextSpan(
                                                              text:
                                                                  "${Jiffy(snapshot.data![index].created!).format('do MMMM yyyy • h:mm')}",
                                                              style: FontTextStyle
                                                                  .kGreyLight514W600PR),
                                                          // TextSpan(
                                                          //     text: "  10:40",
                                                          //     style: FontTextStyle
                                                          //         .kGreyLight514W600PR),
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   height: 12,
                                                    // ),
                                                    // data[index]['text2']
                                                    //         .toString()
                                                    //         .isEmpty
                                                    //     ? SizedBox()
                                                    //     : Container(
                                                    //         height: 20,
                                                    //         width: 92,
                                                    //         color:
                                                    //             Color(0xFFFECDCC),
                                                    //         child: Center(
                                                    //           child: Text(
                                                    //             '${data[index]['text2']}',
                                                    //             style: FontTextStyle
                                                    //                 .kRed210W700SSP,
                                                    //           ),
                                                    //         ),
                                                    //       )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),

                                      ///Load More
                                      // controller.circularBool
                                      //     ? Center(
                                      //         child:
                                      //             CircularProgressIndicator())
                                      //     : GestureDetector(
                                      //         onTap: () async {
                                      //           controller
                                      //               .setCircularBool();
                                      //
                                      //           // controller.newsCategoryPageRefresh(
                                      //           //     '${controller.newsCategoryList.length / 10 + 1}');
                                      //           await controller
                                      //               .newsCategoryViewModel(
                                      //                   '${(controller.newsCategoryList.length + controller.newsCategoryListFirstData.length) / 10 + 1}');
                                      //
                                      //           // print(
                                      //           //     '----------length-------------------${controller.newsCategoryList.length + 10}');
                                      //           // controller.getNewsCategory(
                                      //           //     isRefresh: false,
                                      //           //     page:
                                      //           //         '${controller.newsCategoryList.length / 10 + 1}');
                                      //
                                      //           //     .then((value) {
                                      //           //   if (controller.apiResponse.status ==
                                      //           //       Status.COMPLETE) {
                                      //           //     NewsCategoryResponseModel _res =
                                      //           //         controller.apiResponse.data;
                                      //           //     controller.setCircularBool();
                                      //           //   }
                                      //           // });
                                      //           setState(() {});
                                      //         },
                                      //         child: Align(
                                      //           alignment: Alignment.center,
                                      //           child: Container(
                                      //             height: 52,
                                      //             width: 119,
                                      //             color: Color(0xFF32A3FD),
                                      //             child: Center(
                                      //               child: Text(
                                      //                 'LOAD MORE',
                                      //                 style: TextStyle(
                                      //                   color: Colors.white,
                                      //                   fontSize: 14,
                                      //                   fontWeight:
                                      //                       FontWeight.w600,
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.035,
                                    ),
                                    Container(
                                      height: 815, // height: Get.height,
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
                                                  image: AssetImage(
                                                      'assets/images/round.png'),
                                                  fit: BoxFit.fitWidth),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: Get.width * 0.025),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    IntrinsicWidth(
                                                      child: Column(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment.start,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .apartment_rounded,
                                                            color: Color(
                                                                0xFF546088),
                                                          ),
                                                          Container(
                                                            width: 2,
                                                            height: 150,
                                                            color: Color(
                                                                0xFF546088),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // SizedBox(height: 30),
                                                        Text(
                                                          'SIGN UP TO JOIN',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Get.width * 0.15,
                                                          child: Text(
                                                            'Get priority news access',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 36,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      children: [
                                                        Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xFF546088),
                                                        ),
                                                        Container(
                                                          width: 2,
                                                          height: Get.height *
                                                              0.078,
                                                          color:
                                                              Color(0xFF546088),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'All the latest news',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Get.width * 0.15,
                                                          child: Text(
                                                            'Stay up to date with news from the tourism and hospitality industry.',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      children: [
                                                        Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xFF546088),
                                                        ),
                                                        Container(
                                                          width: 2,
                                                          height: Get.height *
                                                              0.078,
                                                          color:
                                                              Color(0xFF546088),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Credible sources',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Get.width * 0.15,
                                                          child: Text(
                                                            'I’ts gathered from hundreds of trusted sources and updates in real time.',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      children: [
                                                        Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xFF546088),
                                                        ),
                                                        Container(
                                                          width: 2,
                                                          height: Get.height *
                                                              0.078,
                                                          color:
                                                              Color(0xFF546088),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Wide scope of research',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Get.width * 0.15,
                                                          child: Text(
                                                            'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      children: [
                                                        SizedBox(width: 24),
                                                        Container(
                                                          width: 2,
                                                          height: Get.height *
                                                              0.078,
                                                          color:
                                                              Color(0xFF546088),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 20),
                                                    Container(
                                                        height: 36,
                                                        width: 248,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .person_add,
                                                                  size: 15),
                                                              Text(
                                                                'Sign up now. It’s free',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFF272E41),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .download_rounded,
                                                          color:
                                                              Color(0xFF546088),
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
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              Get.width * 0.15,
                                                          child: Text(
                                                            'OR IMPORT YOUR DETAILS FROM',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      children: [
                                                        SizedBox(width: 24),
                                                        Container(
                                                          width: 2,
                                                          height: Get.height *
                                                              0.078,
                                                          color:
                                                              Color(0xFF546088),
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF344F8D),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
                                                              ),
                                                              child: Center(
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      'assets/icons/fb.png'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Flexible(
                                                            child: Container(
                                                              height: 36,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFD63B30),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
                                                              ),
                                                              child: Center(
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      'assets/icons/gp.png'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Flexible(
                                                            child: Container(
                                                              height: 36,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF04595B),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
                                                              ),
                                                              child: Center(
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      'assets/icons/x.png'),
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
                                      width: 336,
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/Bannerimage.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            appBar: CommonWidget.tabletAppBarLogIn(
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            endDrawer: CommonWidget.drawer(context),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
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
                  Container(
                    // margin:
                    //     EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                    height: Get.height * 0.06,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFBDC4C7), width: 2))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final category in Get.put(HoledoDatabase())
                            .articleCategories
                            .where((category) => category.menuItem == true))
                          NavigationBox(
                            title: category.title.toString(),
                            path: '/news1/${category.slug}',
                            inDrawer: false,
                          ),
                      ],
                    ),
                  ),
                  SB.SH20(),
                  Container(
                    // height: Get.height,
                    width: Get.width,
                    color: ColorPicker.kPrimaryLight,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            // height: Get.height * 0.3,
                            width: Get.width * 0.3,
                            child: Image(
                                image: AssetImage('assets/images/round.png'),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.08,
                              vertical: Get.width * 0.15),
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
                                          color: ColorPicker.kPrimaryLight3,
                                        ),
                                        Container(
                                          width: 2,
                                          height: Get.height * 0.09,
                                          color: ColorPicker.kPrimaryLight3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonWidget.text(
                                        'SIGN UP TO JOIN',
                                        style: FontTextStyle.kWhite12W700SSP,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'Get priority news access',
                                          style: FontTextStyle.kWhite36W400SSP,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SB.SH10(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.verified,
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonWidget.text(
                                        'All the latest news',
                                        style: FontTextStyle.kWhite16W700SSP,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'Stay up to date with news from the tourism and hospitality industry.',
                                          style: FontTextStyle.kWhite14W400SSP,
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
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonWidget.text(
                                        'Credible sources',
                                        style: FontTextStyle.kWhite16W700SSP,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'I’ts gathered from hundreds of trusted sources and updates in real time.',
                                          style: FontTextStyle.kWhite14W400SSP,
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
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonWidget.text(
                                        'Wide scope of research',
                                        style: FontTextStyle.kWhite16W700SSP,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
                                          style: FontTextStyle.kWhite14W400SSP,
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
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Container(
                                      height: 36,
                                      width: Get.width * 0.6,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.person_add,
                                                size: 15,
                                                color: ColorPicker.kBlueDark1),
                                            SB.SW5(),
                                            CommonWidget.text(
                                              'Sign up now. It’s free',
                                              style: FontTextStyle
                                                  .kBlueDark114W600SSP,
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
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'OR IMPORT YOUR\nDETAILS FROM',
                                          style: FontTextStyle.kWhite13W700SSP,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SB.SH10(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.start,
                                    children: [
                                      SB.SW10(),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: ColorPicker.kPrimaryLight3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  SizedBox(
                                    width: Get.width * 0.7,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                              color: ColorPicker.kSocial,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                  'assets/icons/fb.png'),
                                            ),
                                          ),
                                        ),
                                        SB.SW5(),
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                              color: ColorPicker.kRedGoogle,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                  'assets/icons/gp.png'),
                                            ),
                                          ),
                                        ),
                                        SB.SW5(),
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF04595B),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                  'assets/icons/x.png'),
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
                  SB.SH20(),
                  Container(
                    /* RefreshIndicator(
                      onRefresh: _refresh,
                      child: LoadMore(
                        whenEmptyLoad: false,
                        delegate: DefaultLoadMoreDelegate(),
                        textBuilder: DefaultLoadMoreTextBuilder.chinese,
                        onLoadMore: _loadMore,
                        child: Column(
                          children: [
                            ListView.builder(
                              controller: _scrollController,
                              itemCount: count,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    print('hello');
                                    print(
                                        '----id-setNewsDataId----${articleList[index].id.toString()}');

                                    PreferenceManager.setNewsDataId(
                                        articleList[index].id.toString());
                                    print(
                                        '----PreferenceManager.getNewsDataId()---------------${PreferenceManager.getNewsDataId()}');
                                    Routemaster.of(context).push(
                                        '/article/${articleList[index].articleCategories?.first.slug}/${articleList[index].slug}');
                                    // Get.to(NewsSingleLoggedInScreen());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(bottom: 10),
                                    color: Colors.white,
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              '${articleList[index].bannerImage}'),
                                          width: Get.width,
                                          height: Get.width * 0.4,
                                          fit: BoxFit.cover,
                                        ),
                                        SB.SH20(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            CommonWidget.text(
                                              '${articleList[index].title}',
                                              style: FontTextStyle
                                                  .kBlueDark118W700SSP,
                                            ),
                                            SB.SH10(),
                                            RichText(
                                              text: TextSpan(
                                                text: "By: ",
                                                style: FontTextStyle
                                                    .kGreyLight514W400SSP
                                                    .copyWith(height: 1.5),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "${articleList[index].user!.fullName}  •  ",
                                                      style: FontTextStyle
                                                          .kGreyLight514W600SSP),
                                                  TextSpan(
                                                      text:
                                                          "${Jiffy(articleList[index].created!).format('do MMMM yyyy • h:mm')}",
                                                      style: FontTextStyle
                                                          .kGreyLight514W400SSP),
                                                ],
                                              ),
                                            ),
                                            // SB.SH10(),
                                            // data[index]['text2'].toString().isEmpty
                                            //     ? SizedBox()
                                            //     : Container(
                                            //         padding: EdgeInsets.all(5),
                                            //         child: CommonWidget.text(
                                            //             'MEMBERS ONLY',
                                            //             style: FontTextStyle
                                            //                 .kRed210W700SSP),
                                            //         decoration: BoxDecoration(
                                            //           color: ColorPicker.kRedlight,
                                            //           borderRadius:
                                            //               BorderRadius.circular(2),
                                            //         ),
                                            //       ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SB.SH20(),
                          ],
                        ),
                      ),
                    ),*/
                    child: FutureBuilder(
                      // future: _future,
                      future: Get.put(HoledoDatabase().news)
                          .fetchArticles(context: context),
                      builder:
                          (context, AsyncSnapshot<List<Article>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text("Error"));
                        }
                        if (!snapshot.hasData) {
                          return Center(child: Text("Error"));
                        } else {
                          return Column(
                            children: [
                              ListView.builder(
                                controller: _scrollController,
                                itemCount: snapshot.data!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      print('hello');
                                      print(
                                          '----id-setNewsDataId----${snapshot.data![index].id.toString()}');

                                      PreferenceManager.setNewsDataId(
                                          snapshot.data![index].id.toString());
                                      print(
                                          '----PreferenceManager.getNewsDataId()---------------${PreferenceManager.getNewsDataId()}');
                                      Routemaster.of(context).push(
                                          '/article/${snapshot.data![index].articleCategories?.first.slug}/${snapshot.data![index].slug}');
                                      // Get.to(NewsSingleLoggedInScreen());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(bottom: 10),
                                      color: Colors.white,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                '${snapshot.data![index].bannerImage}'),
                                            width: Get.width,
                                            height: Get.width * 0.4,
                                            fit: BoxFit.cover,
                                          ),
                                          SB.SH20(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CommonWidget.text(
                                                '${snapshot.data![index].title}',
                                                style: FontTextStyle
                                                    .kBlueDark118W700SSP,
                                              ),
                                              SB.SH10(),
                                              RichText(
                                                text: TextSpan(
                                                  text: "By: ",
                                                  style: FontTextStyle
                                                      .kGreyLight514W400SSP
                                                      .copyWith(height: 1.5),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "${snapshot.data![index].user!.fullName}  •  ",
                                                        style: FontTextStyle
                                                            .kGreyLight514W600SSP),
                                                    TextSpan(
                                                        text:
                                                            "${Jiffy(snapshot.data![index].created!).format('do MMMM yyyy • h:mm')}",
                                                        style: FontTextStyle
                                                            .kGreyLight514W400SSP),
                                                  ],
                                                ),
                                              ),
                                              // SB.SH10(),
                                              // data[index]['text2'].toString().isEmpty
                                              //     ? SizedBox()
                                              //     : Container(
                                              //         padding: EdgeInsets.all(5),
                                              //         child: CommonWidget.text(
                                              //             'MEMBERS ONLY',
                                              //             style: FontTextStyle
                                              //                 .kRed210W700SSP),
                                              //         decoration: BoxDecoration(
                                              //           color: ColorPicker.kRedlight,
                                              //           borderRadius:
                                              //               BorderRadius.circular(2),
                                              //         ),
                                              //       ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SB.SH20(),

                              ///Load More
                              // controller.circularBool
                              //     ? Center(child: CircularProgressIndicator())
                              //     : GestureDetector(
                              //   onTap: () async {
                              //     controller.setCircularBool();
                              //
                              //     // controller.newsCategoryPageRefresh(
                              //     //     '${controller.newsCategoryList.length / 10 + 1}');
                              //
                              //     await controller.newsCategoryViewModel(
                              //         '${controller.newsCategoryListMOB.length / 10 + 1}');
                              //
                              //     // print(
                              //     //     '----------length-------------------${controller.newsCategoryList.length + 10}');
                              //     // controller.getNewsCategory(
                              //     //     isRefresh: false,
                              //     //     page:
                              //     //         '${controller.newsCategoryList.length / 10 + 1}');
                              //
                              //     //     .then((value) {
                              //     //   if (controller.apiResponse.status ==
                              //     //       Status.COMPLETE) {
                              //     //     NewsCategoryResponseModel _res =
                              //     //         controller.apiResponse.data;
                              //     //     controller.setCircularBool();
                              //     //   }
                              //     // });
                              //     setState(() {});
                              //   },
                              //   child: Container(
                              //     height: 52,
                              //     width: 119,
                              //     child: Center(
                              //         child: CommonWidget.text(
                              //           'LOAD MORE',
                              //           style: FontTextStyle.kWhite14W600SSP,
                              //         )),
                              //     decoration: BoxDecoration(
                              //         color: ColorPicker.kBlueLight1,
                              //         borderRadius:
                              //         BorderRadius.circular(2)),
                              //   ),
                              // ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FutureBuilder(
                        // future: _future,
                        future: Get.put(HoledoDatabase().news)
                            .fetchArticles(context: context),
                        builder:
                            (context, AsyncSnapshot<List<Article>> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Column(
                              children: [
                                ListView.builder(
                                  controller: _scrollController,
                                  itemCount: snapshot.data!.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        print('hello');
                                        print(
                                            '----id-setNewsDataId----${snapshot.data![index].id.toString()}');

                                        PreferenceManager.setNewsDataId(snapshot
                                            .data![index].id
                                            .toString());
                                        print(
                                            '----PreferenceManager.getNewsDataId()---------------${PreferenceManager.getNewsDataId()}');
                                        Routemaster.of(context).push(
                                            '/article/${snapshot.data![index].articleCategories?.first.slug}/${snapshot.data![index].slug}');
                                        // Get.to(NewsSingleLoggedInScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(bottom: 10),
                                        color: Colors.white,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Image(
                                              image: NetworkImage(
                                                  '${snapshot.data![index].bannerImage}'),
                                              width: Get.width,
                                              height: Get.width * 0.4,
                                              fit: BoxFit.cover,
                                            ),
                                            SB.SH20(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CommonWidget.text(
                                                  '${snapshot.data![index].title}',
                                                  style: FontTextStyle
                                                      .kBlueDark118W700SSP,
                                                ),
                                                SB.SH10(),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "By: ",
                                                    style: FontTextStyle
                                                        .kGreyLight514W400SSP
                                                        .copyWith(height: 1.5),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "${snapshot.data![index].user!.fullName}  •  ",
                                                          style: FontTextStyle
                                                              .kGreyLight514W600SSP),
                                                      TextSpan(
                                                          text:
                                                              "${Jiffy(snapshot.data![index].created!).format('do MMMM yyyy • h:mm')}",
                                                          style: FontTextStyle
                                                              .kGreyLight514W400SSP),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SB.SH20(),

                                ///Load More
                                // controller.circularBool
                                //     ? Center(child: CircularProgressIndicator())
                                //     : GestureDetector(
                                //   onTap: () async {
                                //     controller.setCircularBool();
                                //
                                //     // controller.newsCategoryPageRefresh(
                                //     //     '${controller.newsCategoryList.length / 10 + 1}');
                                //
                                //     await controller.newsCategoryViewModel(
                                //         '${controller.newsCategoryListMOB.length / 10 + 1}');
                                //
                                //     // print(
                                //     //     '----------length-------------------${controller.newsCategoryList.length + 10}');
                                //     // controller.getNewsCategory(
                                //     //     isRefresh: false,
                                //     //     page:
                                //     //         '${controller.newsCategoryList.length / 10 + 1}');
                                //
                                //     //     .then((value) {
                                //     //   if (controller.apiResponse.status ==
                                //     //       Status.COMPLETE) {
                                //     //     NewsCategoryResponseModel _res =
                                //     //         controller.apiResponse.data;
                                //     //     controller.setCircularBool();
                                //     //   }
                                //     // });
                                //     setState(() {});
                                //   },
                                //   child: Container(
                                //     height: 52,
                                //     width: 119,
                                //     child: Center(
                                //         child: CommonWidget.text(
                                //           'LOAD MORE',
                                //           style: FontTextStyle.kWhite14W600SSP,
                                //         )),
                                //     decoration: BoxDecoration(
                                //         color: ColorPicker.kBlueLight1,
                                //         borderRadius:
                                //         BorderRadius.circular(2)),
                                //   ),
                                // ),
                              ],
                            );
                          }
                          //   CustomScrollView(
                          //   slivers: <Widget>[
                          //     SliverGrid(
                          //       delegate: SliverChildBuilderDelegate(
                          //         (context, index) {
                          //           return NewsSingleCard(
                          //               article: snapshot.data![index],
                          //               showReleaseDate: true);
                          //         },
                          //         childCount: snapshot.data!.length,
                          //       ),
                          //       gridDelegate:
                          //           const SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 1,
                          //         mainAxisSpacing: 15,
                          //         crossAxisSpacing: 15,
                          //         childAspectRatio: 2.0,
                          //       ),
                          //     ),
                          //   ],
                          // );
                        },
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 52,
                        width: 119,
                        color: Color(0xFF32A3FD),
                        child: Center(
                          child: Text(
                            'LOAD MORE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

/*
                  ///LOAD MORE
                  Container(
                    height: 52,
                    width: 119,
                    child: Center(
                        child: CommonWidget.text(
                      'LOAD MORE',
                      style: FontTextStyle.kWhite14W600SSP,
                    )),
                    decoration: BoxDecoration(
                        color: ColorPicker.kBlueLight1,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  SB.SH30(),

                  ///Banner Image
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.width * 0.8,
                    width: Get.width,
                    color: Colors.white,
                    child: Image(
                      image: AssetImage('assets/images/BannerImage.png'),
                      fit: BoxFit.cover,
                    ),
                  )*/
                ],
              ),
            ));
  }
}
