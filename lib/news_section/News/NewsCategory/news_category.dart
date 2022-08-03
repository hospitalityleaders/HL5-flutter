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
import 'package:holedo/news_section/News/news_components/signIn_to_join_widget.dart';
import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/header.dart';
import 'package:holedo/services/holedo_api_services.dart';

import 'package:jiffy/jiffy.dart';
import 'package:loadmore/loadmore.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
  // var _scrollController = ScrollController();
  ScrollController _scrollController = ScrollController();
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
  bool endOFPage = false;

  Future<List<Article>> fetchArticles1(
      {String? category,
      String? keyword,
      String? type,
      required int? limit,
      required int? page,
      required BuildContext context}) async {
    try {
      // isLoading(true);
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

        print('DATA LIST-----------:${dataList.length}');
        for (final data in list) {
          //articleList.add(data);
          // print('c ${data.id} ${(articleList.any((e) => e.id == data.id))}');

          if ((articleList.any((e) => e.id == data.id)) != true) {
            print('adding ${data.id}');
            articleList.add(data);
          }
        }
        print('localcache111: count: ${articleList.length}');
      }
      return dataList.value as List<Article>;
    } finally {
      isLoading(false);
    }
  }

  Future<List<Article>>? _future;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print('news detail page');
    _tabController = TabController(length: 5, vsync: this);

    // LandingPage(page: 'NewsCategory');
    newsCategoryViewModel.newsCategoryViewModel('1');
    super.initState();
    print('SUPER INIT STATE-------------');

    /* _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('_scrollController');
          setState(() {
            Get.put(HoledoDatabase().news)
                .fetchArticles1(context: context, limit: limit, page: page);
            // _future =
            //     fetchArticles1(context: context, limit: limit, page: page);
          });
        } else {
          print('_scrollController bottom');

          print('LIMIT---${limit}');
          print('PAGE---${page}');
          setState(() {
            Get.put(HoledoDatabase().news)
                .fetchArticles1(context: context, limit: limit, page: page);
          });
          limit = limit += 10;
          page = page += 1;
          // _future = fetchArticles1(context: context, limit: limit, page: page);

          // limit + 10;
          // page + 1;
          //
          // Get.put(HoledoDatabase().news)
          //     .fetchArticles1(context: context, limit: limit, page: page);
        }
      }
    });*/
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        /*if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          setState(() {
            print("reach the bottom");
            endOFPage = true;
          });
        }*/
        setState(() {
          fetchArticles1(context: context, limit: limit, page: page);
          limit = limit += 10;
          // page = page += 1;
          // _future =
          //     fetchArticles1(context: context, limit: limit, page: page);
        });
        /* if (!isLoading) {
          isLoading = !isLoading;
          // Perform event when user reach at the end of list (e.g. do Api call)
        }*/
      }
    });
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
        'NEWS SLIDER Catagory --------------------------${newsController.dataList.length}');
    final featuredNews =
        newsController.fetchArticles(context: context, type: 'featured');
    return Scaffold(
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
                width: double.infinity,
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
                        path: '/news1/${category.slug}',
                        inDrawer: false,
                      ),
                  ],
                ),
              ),

              SB.SH20(),
              // Container(
              //   // height: Get.height,
              //   width: Get.width,
              //   color: ColorPicker.kPrimaryLight,
              //   child: Stack(
              //     children: [
              //       Positioned(
              //         top: 0,
              //         left: 0,
              //         child: Container(
              //           // height: Get.height * 0.3,
              //           width: Get.width * 0.3,
              //           child: Image(
              //               image: AssetImage('assets/images/round.png'),
              //               fit: BoxFit.fitWidth),
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: Get.width * 0.08,
              //             vertical: Get.width * 0.15),
              //         child: Column(
              //           children: [
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 IntrinsicWidth(
              //                   child: Column(
              //                     // mainAxisAlignment:
              //                     //     MainAxisAlignment.start,
              //                     children: [
              //                       Icon(
              //                         Icons.apartment_rounded,
              //                         color: ColorPicker.kPrimaryLight3,
              //                       ),
              //                       Container(
              //                         width: 2,
              //                         height: Get.height * 0.09,
              //                         color: ColorPicker.kPrimaryLight3,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 SizedBox(width: Get.width * 0.03),
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     CommonWidget.text(
              //                       'SIGN UP TO JOIN',
              //                       style: FontTextStyle.kWhite12W700SSP,
              //                     ),
              //                     SizedBox(
              //                       width: Get.width * 0.7,
              //                       child: CommonWidget.text(
              //                         'Get priority news access',
              //                         style: FontTextStyle.kWhite36W400SSP,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             SB.SH10(),
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Column(
              //                   // mainAxisAlignment:
              //                   //     MainAxisAlignment.start,
              //                   children: [
              //                     Icon(
              //                       Icons.verified,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                     Container(
              //                       width: 2,
              //                       height: Get.height * 0.078,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(width: Get.width * 0.03),
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     CommonWidget.text(
              //                       'All the latest news',
              //                       style: FontTextStyle.kWhite16W700SSP,
              //                     ),
              //                     SizedBox(
              //                       width: Get.width * 0.7,
              //                       child: CommonWidget.text(
              //                         'Stay up to date with news from the tourism and hospitality industry.',
              //                         style: FontTextStyle.kWhite14W400SSP,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             SizedBox(height: 10),
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Column(
              //                   // mainAxisAlignment:
              //                   //     MainAxisAlignment.start,
              //                   children: [
              //                     Icon(
              //                       Icons.verified,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                     Container(
              //                       width: 2,
              //                       height: Get.height * 0.078,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(width: Get.width * 0.03),
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     CommonWidget.text(
              //                       'Credible sources',
              //                       style: FontTextStyle.kWhite16W700SSP,
              //                     ),
              //                     SizedBox(
              //                       width: Get.width * 0.7,
              //                       child: CommonWidget.text(
              //                         'I’ts gathered from hundreds of trusted sources and updates in real time.',
              //                         style: FontTextStyle.kWhite14W400SSP,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             SizedBox(height: 10),
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Column(
              //                   // mainAxisAlignment:
              //                   //     MainAxisAlignment.start,
              //                   children: [
              //                     Icon(
              //                       Icons.verified,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                     Container(
              //                       width: 2,
              //                       height: Get.height * 0.078,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(width: Get.width * 0.03),
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     CommonWidget.text(
              //                       'Wide scope of research',
              //                       style: FontTextStyle.kWhite16W700SSP,
              //                     ),
              //                     SizedBox(
              //                       width: Get.width * 0.7,
              //                       child: CommonWidget.text(
              //                         'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
              //                         style: FontTextStyle.kWhite14W400SSP,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Column(
              //                   // mainAxisAlignment:
              //                   //     MainAxisAlignment.start,
              //                   children: [
              //                     SizedBox(width: 24),
              //                     Container(
              //                       width: 2,
              //                       height: Get.height * 0.078,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(width: Get.width * 0.03),
              //                 Container(
              //                     height: 36,
              //                     width: Get.width * 0.6,
              //                     decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(2),
              //                     ),
              //                     child: Center(
              //                       child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.center,
              //                         children: [
              //                           Icon(Icons.person_add,
              //                               size: 15,
              //                               color: ColorPicker.kBlueDark1),
              //                           SB.SW5(),
              //                           CommonWidget.text(
              //                             'Sign up now. It’s free',
              //                             style:
              //                                 FontTextStyle.kBlueDark114W600SSP,
              //                           ),
              //                         ],
              //                       ),
              //                     )),
              //               ],
              //             ),
              //             SizedBox(height: 10),
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Column(
              //                   // mainAxisAlignment:
              //                   //     MainAxisAlignment.start,
              //                   children: [
              //                     Icon(
              //                       Icons.download_rounded,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(width: Get.width * 0.03),
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     SizedBox(
              //                       width: Get.width * 0.7,
              //                       child: CommonWidget.text(
              //                         'OR IMPORT YOUR\nDETAILS FROM',
              //                         style: FontTextStyle.kWhite13W700SSP,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             SB.SH10(),
              //             Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Column(
              //                   // mainAxisAlignment:
              //                   //     MainAxisAlignment.start,
              //                   children: [
              //                     SB.SW10(),
              //                     Container(
              //                       width: 2,
              //                       height: Get.height * 0.078,
              //                       color: ColorPicker.kPrimaryLight3,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(width: Get.width * 0.03),
              //                 SizedBox(
              //                   width: Get.width * 0.7,
              //                   child: Row(
              //                     children: [
              //                       Flexible(
              //                         child: Container(
              //                           height: Get.height * 0.05,
              //                           decoration: BoxDecoration(
              //                             color: ColorPicker.kSocial,
              //                             borderRadius:
              //                                 BorderRadius.circular(2),
              //                           ),
              //                           child: Center(
              //                             child: Image.asset(
              //                                 'assets/icons/fb.png'),
              //                           ),
              //                         ),
              //                       ),
              //                       SB.SW5(),
              //                       Flexible(
              //                         child: Container(
              //                           height: Get.height * 0.05,
              //                           decoration: BoxDecoration(
              //                             color: ColorPicker.kRedGoogle,
              //                             borderRadius:
              //                                 BorderRadius.circular(2),
              //                           ),
              //                           child: Center(
              //                             child: Image.asset(
              //                                 'assets/icons/gp.png'),
              //                           ),
              //                         ),
              //                       ),
              //                       SB.SW5(),
              //                       Flexible(
              //                         child: Container(
              //                           height: Get.height * 0.05,
              //                           decoration: BoxDecoration(
              //                             color: Color(0xFF04595B),
              //                             borderRadius:
              //                                 BorderRadius.circular(2),
              //                           ),
              //                           child: Center(
              //                             child:
              //                                 Image.asset('assets/icons/x.png'),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SB.SH20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 700,
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
                                        padding: EdgeInsets.only(bottom: 10),
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 15.0,
                                                  offset: Offset(0.0, 0.2))
                                            ]),
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Image(
                                              image: NetworkImage(
                                                  '${snapshot.data![index].bannerImage}'),
                                              width: 200,
                                              height: 200,
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
                  ),
                  SB.SW15(),
                  Visibility(
                    visible: ResponsiveWrapper.of(context).isLargerThan(TABLET),
                    child: Column(
                      children: [
                        SignInToJoinWidget(),
                        SB.SH20(),
                        Container(
                          height: 250,
                          width: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/book_now_image.png'),
                                fit: BoxFit.fill),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  // FutureBuilder(
                  //   // future: _future,
                  //   future: Get.put(HoledoDatabase().news)
                  //       .fetchArticles(context: context),
                  //   builder: (context, AsyncSnapshot<List<Article>> snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     } else {
                  //       return Column(
                  //         children: [
                  //           ListView.builder(
                  //             controller: _scrollController,
                  //             itemCount: snapshot.data!.length,
                  //             shrinkWrap: true,
                  //             physics: NeverScrollableScrollPhysics(),
                  //             itemBuilder: (context, index) {
                  //               return InkWell(
                  //                 onTap: () {
                  //                   print('hello');
                  //                   print(
                  //                       '----id-setNewsDataId----${snapshot.data![index].id.toString()}');

                  //                   PreferenceManager.setNewsDataId(
                  //                       snapshot.data![index].id.toString());
                  //                   print(
                  //                       '----PreferenceManager.getNewsDataId()---------------${PreferenceManager.getNewsDataId()}');
                  //                   Routemaster.of(context).push(
                  //                       '/article/${snapshot.data![index].articleCategories?.first.slug}/${snapshot.data![index].slug}');
                  //                   // Get.to(NewsSingleLoggedInScreen());
                  //                 },
                  //                 child: Container(
                  //                   padding: EdgeInsets.all(10),
                  //                   margin: EdgeInsets.only(bottom: 10),
                  //                   color: Colors.white,
                  //                   child: ListView(
                  //                     shrinkWrap: true,
                  //                     children: [
                  //                       Image(
                  //                         image: NetworkImage(
                  //                             '${snapshot.data![index].bannerImage}'),
                  //                         width: Get.width,
                  //                         height: Get.width * 0.4,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SB.SH20(),
                  //                       Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceAround,
                  //                         children: [
                  //                           CommonWidget.text(
                  //                             '${snapshot.data![index].title}',
                  //                             style: FontTextStyle
                  //                                 .kBlueDark118W700SSP,
                  //                           ),
                  //                           SB.SH10(),
                  //                           RichText(
                  //                             text: TextSpan(
                  //                               text: "By: ",
                  //                               style: FontTextStyle
                  //                                   .kGreyLight514W400SSP
                  //                                   .copyWith(height: 1.5),
                  //                               children: [
                  //                                 TextSpan(
                  //                                     text:
                  //                                         "${snapshot.data![index].user!.fullName}  •  ",
                  //                                     style: FontTextStyle
                  //                                         .kGreyLight514W600SSP),
                  //                                 TextSpan(
                  //                                     text:
                  //                                         "${Jiffy(snapshot.data![index].created!).format('do MMMM yyyy • h:mm')}",
                  //                                     style: FontTextStyle
                  //                                         .kGreyLight514W400SSP),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //           SB.SH20(),

                  //           ///Load More
                  //           // controller.circularBool
                  //           //     ? Center(child: CircularProgressIndicator())
                  //           //     : GestureDetector(
                  //           //   onTap: () async {
                  //           //     controller.setCircularBool();
                  //           //
                  //           //     // controller.newsCategoryPageRefresh(
                  //           //     //     '${controller.newsCategoryList.length / 10 + 1}');
                  //           //
                  //           //     await controller.newsCategoryViewModel(
                  //           //         '${controller.newsCategoryListMOB.length / 10 + 1}');
                  //           //
                  //           //     // print(
                  //           //     //     '----------length-------------------${controller.newsCategoryList.length + 10}');
                  //           //     // controller.getNewsCategory(
                  //           //     //     isRefresh: false,
                  //           //     //     page:
                  //           //     //         '${controller.newsCategoryList.length / 10 + 1}');
                  //           //
                  //           //     //     .then((value) {
                  //           //     //   if (controller.apiResponse.status ==
                  //           //     //       Status.COMPLETE) {
                  //           //     //     NewsCategoryResponseModel _res =
                  //           //     //         controller.apiResponse.data;
                  //           //     //     controller.setCircularBool();
                  //           //     //   }
                  //           //     // });
                  //           //     setState(() {});
                  //           //   },
                  //           //   child: Container(
                  //           //     height: 52,
                  //           //     width: 119,
                  //           //     child: Center(
                  //           //         child: CommonWidget.text(
                  //           //           'LOAD MORE',
                  //           //           style: FontTextStyle.kWhite14W600SSP,
                  //           //         )),
                  //           //     decoration: BoxDecoration(
                  //           //         color: ColorPicker.kBlueLight1,
                  //           //         borderRadius:
                  //           //         BorderRadius.circular(2)),
                  //           //   ),
                  //           // ),
                  //         ],
                  //       );
                  //     }
                  //     //   CustomScrollView(
                  //     //   slivers: <Widget>[
                  //     //     SliverGrid(
                  //     //       delegate: SliverChildBuilderDelegate(
                  //     //         (context, index) {
                  //     //           return NewsSingleCard(
                  //     //               article: snapshot.data![index],
                  //     //               showReleaseDate: true);
                  //     //         },
                  //     //         childCount: snapshot.data!.length,
                  //     //       ),
                  //     //       gridDelegate:
                  //     //           const SliverGridDelegateWithFixedCrossAxisCount(
                  //     //         crossAxisCount: 1,
                  //     //         mainAxisSpacing: 15,
                  //     //         crossAxisSpacing: 15,
                  //     //         childAspectRatio: 2.0,
                  //     //       ),
                  //     //     ),
                  //     //   ],
                  //     // );
                  //   },
                  // );
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
