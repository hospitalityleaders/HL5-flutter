import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constant/colorPicker/color_picker.dart';
import '../../../constant/fontStyle/font_style.dart';
import '../../../responsive/responsive.dart';
import '../../profile-pages/home-pages/header.dart';
import '../../profile-pages/home-pages/home.dart';
import '../update/update_news.dart';

class NewsSingleScreen extends StatefulWidget {
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
    },
    {
      'img': 'assets/images/t2.png',
      'text1':
          'How Technology Can Deliver a Seamless Travel Experience - Information Age',
      'text2': 'MEMBERS ONLY',
    },
    {
      'img': 'assets/images/t3.png',
      'text1': 'Baha Mar Files Chapter 11 Plan of Reorganization',
      'text2': '',
    },
    {
      'img': 'assets/images/t4.png',
      'text1': 'The Quincy Hotel in Downtown Washington D.C. Sold to RLHC JV',
      'text2': 'MEMBERS ONLY',
    },
    {
      'img': 'assets/images/t5.png',
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
    },
    {
      'img': 'assets/images/t5.png',
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
    },
    {
      'img': 'assets/images/t6.png',
      'text1':
          'Hotel Price Index Reveals Midwest, Southwest and Western Cities Are Surging Domestically',
      'text2': '',
    },
    {
      'img': 'assets/images/t7.png',
      'text1': 'MainStay Suites Hotel Sydney Opens in Montana',
      'text2': '',
    },
    {
      'img': 'assets/images/t8.png',
      'text1': 'California raisin’ prices as deal volume drops',
      'text2': '',
    },
    {
      'img': 'assets/images/t9.png',
      'text1': 'Hotel Industry Opposes NLRB Joint-Employer Decision',
      'text2': 'MEMBERS ONLY',
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
                      physics: NeverScrollableScrollPhysics(),
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
                                      return Container(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage('assets/icons/logo1.png'),
                          ),
                        ),
                        SizedBox(
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
                            SizedBox(height: 5),
                            Text('MENU',
                                style: TextStyle(
                                    fontSize: 9,
                                    color: ColorPicker.kPrimaryLightBlue)),
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
                                Text(
                                  'RESOURCES',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: Get.width * 0.02),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    '5 Steps for Travel Brands to Build a Brand Ambassador Program',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.width * 0.02),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'By: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Pam Carrol',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Get.width * 0.015),
                                Text(
                                  '26 August 2015 • 10:40',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
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
                      title: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
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
                          child: Text(
                            'Hotels and resorts',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            'Food and beverage',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            'Spa',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            'Tourism',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            'Apartments',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            'Tours',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            'Leisure',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            'Boutique Hotels',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          width: 200,
                          child: Text(
                            '+ Show more',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF32A3FD),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
                                            color: Color(0xFF546088),
                                          ),
                                          Container(
                                            width: 2,
                                            height: Get.height * 0.09,
                                            color: Color(0xFF546088),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: Get.width * 0.03),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'SIGN UP TO JOIN',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.7,
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
                                    SizedBox(width: Get.width * 0.03),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          width: Get.width * 0.7,
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
                                    SizedBox(width: Get.width * 0.03),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          width: Get.width * 0.7,
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
                                    SizedBox(width: Get.width * 0.03),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          width: Get.width * 0.7,
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
                                              Icon(Icons.person_add, size: 15),
                                              Text(
                                                'Sign up now. It’s free',
                                                style: TextStyle(
                                                  color:
                                                      ColorPicker.kGreyLight5,
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
                                      ],
                                    ),
                                    SizedBox(width: Get.width * 0.03),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.7,
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
                                    SizedBox(width: Get.width * 0.03),
                                    SizedBox(
                                      width: Get.width * 0.7,
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Container(
                                              height: Get.height * 0.05,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF344F8D),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/icons/fb.png'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Container(
                                              height: Get.height * 0.05,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFD63B30),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/icons/gp.png'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
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
                    SizedBox(height: 20),
                    ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          height: Get.width * 0.8,
                          width: Get.width,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('${data[index]['img']}'),
                                width: Get.width,
                                height: Get.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                              Flexible(
                                child: Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${data[index]['text1']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${data[index]['text3']}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPicker.kGreyLight5,
                                      ),
                                    ),
                                    data[index]['text2'].toString().isEmpty
                                        ? SizedBox()
                                        : Container(
                                            padding: EdgeInsets.all(5),
                                            child: Text('MEMBERS ONLY',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.red)),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFECDCC),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),

                    ///LOAD MORE
                    Container(
                      height: 52,
                      width: 119,
                      child: Center(
                          child: Text(
                        'LOAD MORE',
                        style: TextStyle(),
                      )),
                      decoration: BoxDecoration(
                          color: Color(0xFF32A3FD),
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(height: 20),

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
