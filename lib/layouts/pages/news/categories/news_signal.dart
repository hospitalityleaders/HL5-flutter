import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/common_widget.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/fontStyle/font_style.dart';
import '../../../../constant/sizedbox.dart';
import '../../../../responsive/responsive.dart';

import '../../profile-pages/profile/header.dart';
import '../NewsSingle/news_single_logged_in.dart';

class NewsSingleScreen extends StatefulWidget {
  static const String route = '/category';
  @override
  _NewsSignalScreenState createState() => _NewsSignalScreenState();
}

class _NewsSignalScreenState extends State<NewsSingleScreen>
    with SingleTickerProviderStateMixin {
  CarouselController buttonCarouselController = CarouselController();
  TabController? _tabController;
  int _current = 0;
  int tabBar = 0;
  int indexCircle = 0;
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

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

  buildHeaderGesture(
      String menuName, _fontStyle, BuildContext context, routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
          return routeName;
        }));
      },
      child: Text(menuName, style: _fontStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Responsive.isDesktop(context)
          ? Scaffold(
              body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Header(),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: Get.height * 0.50,
                      width: Get.width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: Get.height * 0.50,
                              viewportFraction: 1.0,
                              initialPage: 3,
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
                            items: [
                              Container(
                                height: Get.height * 0.05,
                                width: Get.width,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/slider1.png'),
                                ),
                              ),
                              // RaisedButton(
                              //   onPressed: () => buttonCarouselController.nextPage(
                              //       duration: Duration(milliseconds: 300),
                              //       curve: Curves.linear),
                              //   child: Text('→'),
                              // )
                            ],
                          ),
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
                          Positioned(
                              left: Get.width * 0.05,
                              bottom: Get.width * 0.02,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'RESOURCES',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '5 Steps for Travel Brands to Build a Brand\nAmbassador Program',
                                    style: FontTextStyle.kWhite36W400SSP,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'By: Pam Carrol • 26 August 2015 • 10:40',
                                    style: FontTextStyle.kWhite14W400SSP,
                                  ),
                                ],
                              )),
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
                              bottom: BorderSide(
                                  color: Color(0xFFBDC4C7), width: 2))),
                      child: TabBar(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.3),
                        unselectedLabelColor: ColorPicker.kGreyLight7,
                        labelColor: ColorPicker.kBlueLight1,
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        labelStyle: FontTextStyle.kBlueLight114W600SSP,
                        tabs: [
                          Tab(
                            text: "Resources",
                          ),
                          Tab(
                            text: "Travel",
                          ),
                          Tab(
                            text: "Developments",
                          ),
                          Tab(
                            text: "International",
                          ),
                          Tab(
                            text: "Investments",
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.symmetric(
                                        vertical:
                                            BorderSide(color: Colors.white)),
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
                                          image: AssetImage(
                                              'assets/images/news1.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'RESOURCES',
                                        style:
                                            FontTextStyle.kGreyLight712W700SSP,
                                      ),
                                      Text(
                                        'Moxy Hotels Makes Some Movies, Well Youtube Ones',
                                        style:
                                            FontTextStyle.kBlueDark136W400SSP,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: "by",
                                                style: FontTextStyle
                                                    .kGreyLight5146W400SSP,
                                                children: [
                                                  TextSpan(
                                                      text: "  Pam Carrol •",
                                                      style: FontTextStyle
                                                          .kGreyLight5146W400SSP),
                                                  TextSpan(
                                                      text:
                                                          "  26 August 2015 •",
                                                      style: FontTextStyle
                                                          .kGreyLight5146W400SSP),
                                                  TextSpan(
                                                      text: "  10:40",
                                                      style: FontTextStyle
                                                          .kGreyLight5146W400SSP),
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
                                                    width: Get.width * 0.01,
                                                  ),
                                                  SvgPicture.asset(
                                                      'assets/icons/svg/twitter.svg'),
                                                  Text('  • 56',
                                                      style: FontTextStyle
                                                          .kGreyLight5146W400SSP),
                                                  SizedBox(
                                                    width: Get.width * 0.01,
                                                  ),
                                                  SvgPicture.asset(
                                                      'assets/icons/svg/googleplus.svg'),
                                                  Text(
                                                    '  • 321',
                                                    style: FontTextStyle
                                                        .kGreyLight5146W400SSP,
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.01,
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
                                                    width: Get.width * 0.01,
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
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.symmetric(
                                        vertical:
                                            BorderSide(color: Colors.white)),
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
                                          image: AssetImage(
                                              'assets/images/news2.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'RESOURCES',
                                        style:
                                            FontTextStyle.kGreyLight513W700SSP,
                                      ),
                                      Text(
                                        'Hotel on North opens in Pittsfield,\nMassachusetts',
                                        style:
                                            FontTextStyle.kGreyLight536W400SSP,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: "by",
                                                style: FontTextStyle
                                                    .kGreyLight5146W400SSP,
                                                children: [
                                                  TextSpan(
                                                      text: "  Pam Carrol •",
                                                      style: FontTextStyle
                                                          .kGreyLight5146W400SSP),
                                                  TextSpan(
                                                      text:
                                                          "  26 August 2015 •",
                                                      style: FontTextStyle
                                                          .kGreyLight5146W400SSP),
                                                  TextSpan(
                                                      text: "  10:40",
                                                      style: FontTextStyle
                                                          .kGreyLight5146W400SSP),
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
                                                    width: Get.width * 0.01,
                                                  ),
                                                  SvgPicture.asset(
                                                      'assets/icons/svg/twitter.svg'),
                                                  Text(
                                                    '  • 56',
                                                    style: FontTextStyle
                                                        .kGreyLight5146W400SSP,
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.01,
                                                  ),
                                                  SvgPicture.asset(
                                                      'assets/icons/svg/googleplus.svg'),
                                                  Text(
                                                    '  • 321',
                                                    style: FontTextStyle
                                                        .kGreyLight5146W400SSP,
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.01,
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
                                                    width: Get.width * 0.01,
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
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio:
                                                Get.width / (Get.height / 0.75),
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10),
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              NewsSingleLoggedInScreen.route);
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
                                                  image: AssetImage(
                                                      '${data[index]['img']}'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '${data[index]['text1']}',
                                                  style: FontTextStyle
                                                      .kBlueDark118W700SSP,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: "by",
                                                  style: FontTextStyle
                                                      .kGreyLight514W600PR,
                                                  children: [
                                                    TextSpan(
                                                        text: "  Pam Carrol •",
                                                        style: FontTextStyle
                                                            .kGreyLight514W600PR),
                                                    TextSpan(
                                                        text:
                                                            "  26 August 2015 •",
                                                        style: FontTextStyle
                                                            .kGreyLight514W600PR),
                                                    TextSpan(
                                                        text: "  10:40",
                                                        style: FontTextStyle
                                                            .kGreyLight514W600PR),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              data[index]['text2']
                                                      .toString()
                                                      .isEmpty
                                                  ? SizedBox()
                                                  : Container(
                                                      height: 20,
                                                      width: 92,
                                                      color: Color(0xFFFECDCC),
                                                      child: Center(
                                                        child: Text(
                                                          '${data[index]['text2']}',
                                                          style: FontTextStyle
                                                              .kRed210W700SSP,
                                                        ),
                                                      ),
                                                    )
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
                                Align(
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    width: Get.width * 0.15,
                                                    child: Text(
                                                      'Get priority news access',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    width: Get.width * 0.15,
                                                    child: Text(
                                                      'Stay up to date with news from the tourism and hospitality industry.',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    width: Get.width * 0.15,
                                                    child: Text(
                                                      'I’ts gathered from hundreds of trusted sources and updates in real time.',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    width: Get.width * 0.15,
                                                    child: Text(
                                                      'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.person_add,
                                                            size: 15),
                                                        Text(
                                                          'Sign up now. It’s free',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF272E41),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.15,
                                                    child: Text(
                                                      'OR IMPORT YOUR DETAILS FROM',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF344F8D),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
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
                                                          color:
                                                              Color(0xFFD63B30),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
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
                                                          color:
                                                              Color(0xFF04595B),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
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
                    ),
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ))
          : Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(46),
                child: Container(
                    height: 46,
                    width: Get.width,
                    color: ColorPicker.kPrimaryLight1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage('assets/icons/logo1.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: ColorPicker.kPrimaryLight1,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: FontTextStyle.kWhitePR,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: ColorPicker.kPrimaryLightBlue,
                                ),
                                filled: true,
                                fillColor: ColorPicker.kPrimaryLight,
                                hintText: "Search",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: ColorPicker.kPrimaryLightBlue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/menu.png',
                              height: 18,
                              width: 25,
                              fit: BoxFit.cover,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            SB.SH5(),
                            CommonWidget.text('MENU',
                                style: FontTextStyle.kPrimaryLightBlue9W700SSP),
                          ],
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                      ],
                    )),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: Get.width * 0.8,
                      width: Get.width,
                      child: PageView.builder(
                        onPageChanged: (value) {
                          print('-value----${value}');
                          setState(() {
                            indexCircle = value;
                          });
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                              bottom: Get.width * 0.03,
                              left: Get.width * 0.03,
                            ),
                            height: Get.width * 0.5,
                            width: Get.width,
                            // width: 200,

                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/images/slider1.png'),
                              fit: BoxFit.fitHeight,
                            )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonWidget.text(
                                  'RESOURCES',
                                  style: FontTextStyle.kWhite12W700SSP,
                                ),
                                SizedBox(height: Get.width * 0.02),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: CommonWidget.text(
                                    '5 Steps for Travel Brands to Build a Brand Ambassador Program',
                                    style: FontTextStyle.kWhite26W400SSP,
                                  ),
                                ),
                                SizedBox(height: Get.width * 0.02),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'By: ',
                                        style: FontTextStyle.kWhite14W400SSP,
                                      ),
                                      TextSpan(
                                        text: 'Pam Carrol',
                                        style: FontTextStyle.kWhite14W600SSP,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Get.width * 0.015),
                                CommonWidget.text(
                                  '26 August 2015 • 10:40',
                                  style: FontTextStyle.kWhite14W400SSP,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 1),
                        alignment: Alignment.center,
                        height: 15,
                        width: Get.width,
                        // color: Colors.red,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              // foregroundColor: Colors.red,
                              backgroundColor: index == indexCircle
                                  ? Color(0xFF33A3FE)
                                  : Color(0xFFB5BDC2),
                            );
                          },
                        )),
                    ExpansionTile(
                      title: CommonWidget.text(
                        'Categories',
                        style: FontTextStyle.kBlueDark120W400SSP,
                      ),
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Hotels and resorts',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Food and beverage',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Spa',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Tourism',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Apartments',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Tours',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Leisure',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            'Boutique Hotels',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: CommonWidget.text(
                            '+ Show more',
                            style: FontTextStyle.kBlueLight114W400SSP,
                          ),
                        ),
                      ],
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
                                            style:
                                                FontTextStyle.kWhite36W400SSP,
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
                                            style:
                                                FontTextStyle.kWhite14W400SSP,
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
                                            style:
                                                FontTextStyle.kWhite14W400SSP,
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
                                            style:
                                                FontTextStyle.kWhite14W400SSP,
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
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.person_add,
                                                  size: 15,
                                                  color:
                                                      ColorPicker.kBlueDark1),
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
                                            style:
                                                FontTextStyle.kWhite13W700SSP,
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
                    ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print('hello');
                            Navigator.of(context)
                                .pushNamed(NewsSingleLoggedInScreen.route);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10),
                            color: Colors.white,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Image(
                                  image: AssetImage('${data[index]['img']}'),
                                  width: Get.width,
                                  height: Get.width * 0.4,
                                  fit: BoxFit.cover,
                                ),
                                SB.SH20(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CommonWidget.text(
                                      '${data[index]['text1']}',
                                      style: FontTextStyle.kBlueDark118W700SSP,
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
                                            text: '${data[index]['text3']}',
                                            style: FontTextStyle
                                                .kGreyLight514W600SSP,
                                          ),
                                          TextSpan(
                                            text: ' • ${data[index]['text4']}',
                                            style: FontTextStyle
                                                .kGreyLight514W400SSP,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SB.SH10(),
                                    data[index]['text2'].toString().isEmpty
                                        ? SizedBox()
                                        : Container(
                                            padding: EdgeInsets.all(5),
                                            child: CommonWidget.text(
                                                'MEMBERS ONLY',
                                                style: FontTextStyle
                                                    .kRed210W700SSP),
                                            decoration: BoxDecoration(
                                              color: ColorPicker.kRedlight,
                                              borderRadius:
                                                  BorderRadius.circular(2),
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
                    SB.SH20(),

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
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
