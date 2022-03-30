import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';

import '../../../constant/fontStyle/font_style.dart';
import '../../../responsive/responsive.dart';



class NewsSingleLoggedOutScreen extends StatefulWidget {
  @override
  _NewsSingleLoggedOutScreenState createState() => _NewsSingleLoggedOutScreenState();
}

class _NewsSingleLoggedOutScreenState extends State<NewsSingleLoggedOutScreen> {
  List categories = [
    {
      'text': "Hotels and resorts",
    },
    {
      'text': "Food and beverage",
    },
    {
      'text': "Spa",
    },
    {
      'text': "Tourism",
    },
    {
      'text': "Apartments",
    },
    {
      'text': "Tours",
    },
    {
      'text': "Leisure",
    },
    {
      'text': "Boutique Hotels",
    },
  ];
  List data1 = [
    {
      'txt': "The Internet of Things: The Impact on the Travel and Hotel Industry",
      'img': "assets/images/p1.png",
    },
    {
      'txt': "On Social Media? Maestro PMS Gives Operators, Guests Direct Social Media Booking",
      'img': "assets/images/p2.png",
    },
    {
      'txt': "Hotel Equities to Operate Two Premium-branded Hotels in Northeast",
      'img': "assets/images/p3.png",
    },
    {
      'txt': "The Internet of Things: The Impact on the Travel and Hotel Industry",
      'img': "assets/images/p4.png",
    },
    {
      'txt': "Embracing Startup Culture Values To Succeed in Hospitality",
      'img': "assets/images/p5.png",
    }
  ];
  List data = [
    {
      'img': "assets/images/l1.png",
    },
    {
      'img': "assets/images/l2.png",
    },
    {
      'img': "assets/images/l3.png",
    },
    {
      'img': "assets/images/l4.png",
    },
    {
      'img': "assets/images/l5.png",
    },
    {
      'img': "assets/images/l3.png",
    },
    {
      'img': "assets/images/l3.png",
    },
    {
      'img': "assets/images/l3.png",
    },
  ];

  List suggestNewsData = [
    {
      'img': 'assets/images/t1.png',
      'text1': 'Airbnb value set to soar to US\$25.5 billion',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t2.png',
      'text1': 'Mantra Group Reports Total Revenue Increase of 9.7% for Year Ending June 2015',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t3.png',
      'text1': 'How Technology Can Deliver a Seamless Travel Experience - Information Age',
      'text2': 'MEMBERS ONLY',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t4.png',
      'text1': 'Baha Mar Files Chapter 11 Plan of Reorganization',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t5.png',
      'text1': 'The Quincy Hotel in Downtown Washington D.C. Sold to RLHC JV',
      'text2': 'MEMBERS ONLY',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t6.png',
      'text1': 'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t7.png',
      'text1': 'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t8.png',
      'text1': 'Hotel Price Index Reveals Midwest, Southwest and Western Cities Are Surging Domestically',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t9.png',
      'text1': 'MainStay Suites Hotel Sydney Opens in Montana',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t10.png',
      'text1': 'California raisin’ prices as deal volume drops',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t2.png',
      'text1': 'Hotel Industry Opposes NLRB Joint-Employer Decision',
      'text2': 'MEMBERS ONLY',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
  ];
  List buttonData = [
    {'img': "assets/icons/fb.png", 'color': Color(0xFF344F8D)},
    {'img': "assets/icons/twitter.png", 'color': Color(0xFF00ABF0)},
    {'img': "assets/icons/gp.png", 'color': Color(0xFFD63B30)},
    {'img': "assets/icons/linkdin.png", 'color': Color(0xFF1C86BC)},
    {'img': "assets/icons/x.png", 'color': Color(0xFF04595B)},
  ];

  List likeCommentShare = [
    {
      "img": "assets/icons/like.png",
      "title": "Like",
      "total": "12",
    },
    {
      "img": "assets/icons/comment.png",
      "title": "Comment",
      "total": "20",
    },
    {
      "img": "assets/icons/share.png",
      "title": "Share",
      "total": "45",
    },
  ];

  int currentIndex = 0;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    // CarouselController buttonCarouselController = CarouselController();

    // print('${Get.width}');
    return Responsive.isDesktop(context)
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(46),
              child: Container(
                  height: 46,
                  color: ColorPicker.kPrimaryLight1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/icons/logo.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 270,
                        color: Colors.white,
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
                            prefixIcon: Icon(
                              Icons.search,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            suffixIcon: Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 40,
                              width: Get.width * 0.045,
                              decoration: BoxDecoration(
                                color: ColorPicker.kPrimaryLight1,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'People',
                                  style: TextStyle(
                                    color: ColorPicker.kPrimaryLightBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Container(
                        width: 380,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Home', style: FontTextStyle.kWhite16W400PR),
                            Text('Profile', style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('News', style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('Jobs', style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('Recruitment', style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('Help', style: FontTextStyle.kPrimaryLightBlue16W400PR),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Container(
                        width: Get.width * 0.05,
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                          vertical: BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                        )),
                        child: Center(
                            child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Icon(
                              Icons.email,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: ColorPicker.kRed,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        width: Get.width * 0.05,
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                          vertical: BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                        )),
                        child: Center(
                            child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Icon(
                              Icons.flag,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: ColorPicker.kRed,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                          vertical: BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                        )),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_add,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Color(0xff546088),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text('352', style: FontTextStyle.kPrimaryLight10W700SSP),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        width: Get.width * 0.05,
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                          vertical: BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                        )),
                        child: Center(
                          child: Container(
                            height: 26,
                            width: 26,
                            child: Image(
                              image: AssetImage('assets/images/avatar.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///===1st Container =====
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    color: Color(0xffCCE8FE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.25,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              "New to Hospitality Leaders? Sign up now to join our membership",
                              style: FontTextStyle.kBlueLight114W400PR,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        Container(
                          height: Get.height * 0.032,
                          width: Get.width * 0.08,
                          decoration: BoxDecoration(color: Color(0xff32A3FD), borderRadius: BorderRadius.circular(2)),
                          child: Center(
                              child: Text(
                            "Join now. It’s free",
                            style: FontTextStyle.kWhite12W400PR,
                          )),
                        ),
                        SizedBox(
                          width: Get.width * 0.25,
                        ),
                      ],
                    ),
                  ),

                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: Get.height * 0.5,
                        width: Get.width,
                        // color: Colors.green,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/slider1.png"), fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.03,
                              width: Get.width,
                              color: ColorPicker.kGreyLight5.withOpacity(0.1),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 120.0, top: 7),
                                  child: Text(
                                    "Send news to: editor@hospitality.pro ",
                                    style: FontTextStyle.kWhite12W400PR,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        left: 60,
                        child: Container(
                          height: Get.height * 0.18,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(width: 0.1))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "RESOURCES",
                                  style: FontTextStyle.kGreyLight510W700PR,
                                ),
                                SizedBox(
                                  height: Get.height * 0.005,
                                ),
                                Text(
                                  "5 Steps for Travel Brands to Build a Brand Ambassador Program",
                                  style: FontTextStyle.kBlackPure30W400PR,
                                ),
                                SizedBox(
                                  height: Get.height * 0.006,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.023,
                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/avatar.png"), fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.009,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "By: Pam Carrol",
                                          style: FontTextStyle.kGreyLight515W600PR,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.005,
                                        ),
                                        Text(
                                          "26 August 2015   •   10:40",
                                          style: FontTextStyle.kGreyLight515W600PR,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.6,
                        padding: const EdgeInsets.only(left: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.07,
                            ),
                            Container(
                              // height: 72,
                              // width: 712,
                              // color: Colors.green,
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quisnostrud exercitation ullamco.",
                                style: FontTextStyle.kBlackPure18W400PR,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Container(
                              // height: 175,
                              // width: 712,
                              // color: Colors.red,
                              // color: Colors.green,
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n  \nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\n\n n Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                              style: FontTextStyle.kGreyLight516W400PR,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                              style: FontTextStyle.kGreyLight516W400PR,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 850, // height: Get.height,
                              color: ColorPicker.kPrimaryLight,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -1,
                                    left: 0,
                                    child: Container(
                                      // height: Get.height * 0.3,
                                      width: 100,
                                      child: Image(image: AssetImage('assets/images/round.png'), fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: Get.width * 0.025),
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
                                                  'THIS ARTICLE IS FOR MEMBERS ONLY. SIGN UP TO JOIN',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.35,
                                                  child: Text(
                                                    'You get access to members only exclusive content',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 40,
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
                                                  'Latest news',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.35,
                                                  child: Text(
                                                    'Members stay current with the leading hospitality industry news site.',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
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
                                                  'Exclusive content',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.35,
                                                  child: Text(
                                                    'Get exclusive access to breaking, current and accurate industry news from around the world.',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
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
                                                  'News that matter',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.35,
                                                  child: Text(
                                                    'Our news is selected and edited by professional journalists with decades of experience in reporting the news that matters, keeping you  informed and up-to-date about what is happening in our industry around the world.',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16,
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
                                                          color: ColorPicker.kGreyLight5,
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
                                              width: Get.width * 0.3,
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      height: 36,
                                                      width: 82,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFF344F8D),
                                                        borderRadius: BorderRadius.circular(2),
                                                      ),
                                                      child: Center(
                                                        child: Image(
                                                          image: AssetImage('assets/icons/fb.png'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Flexible(
                                                    child: Container(
                                                      height: 36,
                                                      width: 82,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFD63B30),
                                                        borderRadius: BorderRadius.circular(2),
                                                      ),
                                                      child: Center(
                                                        child: Image(
                                                          image: AssetImage('assets/icons/gp.png'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Flexible(
                                                    child: Container(
                                                      height: 36,
                                                      width: 82,
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
                            Text(
                              'TAGS:',
                              style: FontTextStyle.kGreyLight516W400PR,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: List.generate(
                                  5,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 26,
                                      decoration: BoxDecoration(color: Color(0xffF6F7F8)),
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '#Hospitality',
                                          style: FontTextStyle.kGreyLight614W400PR,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: Divider(
                                  endIndent: 10,
                                  color: ColorPicker.kGreyLight5.withOpacity(0.2),
                                )),
                                Text(
                                  'SUGGESTED NEWS',
                                  style: FontTextStyle.kGreyLight513W700PR,
                                ),
                                Flexible(
                                    child: Divider(
                                  indent: 10,
                                  color: ColorPicker.kGreyLight5.withOpacity(0.2),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 400,
                              // width: 400,
                              child: ListView.builder(
                                itemCount: suggestNewsData.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 400,
                                    width: 400,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage('${suggestNewsData[index]['img']}'),
                                          height: 200,
                                          width: 400,
                                          fit: BoxFit.cover,
                                        ),
                                        Flexible(
                                          child: Container(
                                              child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                '${suggestNewsData[index]['text1']}',
                                                style: FontTextStyle.kBlackPure18W700PR,
                                              ),
                                              Text(
                                                '${suggestNewsData[index]['text3']}',
                                                style: FontTextStyle.kGreyLight514W600PR,
                                              ),
                                              suggestNewsData[index]['text2'].toString().isEmpty
                                                  ? SizedBox()
                                                  : Container(
                                                      padding: EdgeInsets.all(5),
                                                      child: Text(
                                                        'MEMBERS ONLY',
                                                        style: FontTextStyle.kRed10W400PR,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFECDCC),
                                                        borderRadius: BorderRadius.circular(2),
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
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * 0.4,
                        // color: Colors.red,
                        padding: const EdgeInsets.only(left: 100, bottom: 420, right: 70),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 365,
                              width: Get.width,
                              color: Color(0xff0D9BDC),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -1,
                                    left: 0,
                                    child: Container(
                                      // height: Get.height * 0.3,
                                      width: 100,
                                      child: Image(image: AssetImage('assets/images/round2.png'), fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 40,
                                    ),
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
                                                    color: Colors.white,
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 170,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ALL ACCESS',
                                                  style: FontTextStyle.kWhite12W700SSP,
                                                ),
                                                SizedBox(height: 20),
                                                SizedBox(
                                                  width: Get.width * 0.18,
                                                  child: Text(
                                                    'Get full access to the hospitality industry news',
                                                    style: FontTextStyle.kWhite36W400PR.copyWith(fontSize: Get.width * 0.02),
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                    height: 36,
                                                    width: Get.width * 0.16,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(2),
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(Icons.person_add, size: 15),
                                                          SizedBox(width: 10),
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
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IntrinsicWidth(
                                              child: Column(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Icon(
                                                    Icons.download_rounded,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 20,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 15),
                                                Text(
                                                  'OR IMPORT YOUR\nDETAILS FROM',
                                                  style: FontTextStyle.kWhite12W700SSP,
                                                ),
                                                SizedBox(height: 30),
                                                SizedBox(
                                                  width: Get.width * 0.15,
                                                  child: Row(
                                                    children: [
                                                      Flexible(
                                                        child: Container(
                                                          height: 36,
                                                          width: 82,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xFF344F8D),
                                                            borderRadius: BorderRadius.circular(2),
                                                          ),
                                                          child: Center(
                                                            child: Image(
                                                              image: AssetImage('assets/icons/fb.png'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Flexible(
                                                        child: Container(
                                                          height: 36,
                                                          width: 82,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xFFD63B30),
                                                            borderRadius: BorderRadius.circular(2),
                                                          ),
                                                          child: Center(
                                                            child: Image(
                                                              image: AssetImage('assets/icons/gp.png'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Flexible(
                                                        child: Container(
                                                          height: 36,
                                                          width: 82,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 290,
                              width: Get.width,
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/Bannerimage.png'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: Get.width,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: Get.width * 0.01, right: Get.width * 0.01, left: Get.width * 0.01),
                                    child: Text(
                                      'Categories',
                                      style: FontTextStyle.kBlackPure20W400PR,
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 8,
                                    itemBuilder: (context, index) => Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Divider(),
                                        Container(
                                          padding: EdgeInsets.only(top: Get.width * 0.01, right: Get.width * 0.01, bottom: Get.width * 0.01, left: Get.width * 0.01),
                                          child: Text(
                                            '${categories[index]['text']}',
                                            style: FontTextStyle.kBlueLight114W600PR,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Container(
                                    padding: EdgeInsets.all(Get.width * 0.01),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Show more',
                                          style: FontTextStyle.kBlueLight114W600PR,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 10,
                  ),
                ],
              ),
            ),
          )
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
                          decoration: BoxDecoration(color: ColorPicker.kPrimaryLight1, borderRadius: BorderRadius.circular(8)),
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
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.transparent),
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
                          Text('MENU', style: TextStyle(fontSize: 9, color: ColorPicker.kPrimaryLightBlue)),
                        ],
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                    ],
                  )),
            ),
            backgroundColor: ColorPicker.kBg1,
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
                        // setState(() {
                        //   indexCircle = value;
                        // });
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
                          backgroundColor: index == 1 ? Color(0xFF33A3FE) : Color(0xFFB5BDC2),
                        );
                      },
                    ),
                  ),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                            child: Image(image: AssetImage('assets/images/round.png'), fit: BoxFit.fitWidth),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08, vertical: Get.width * 0.15),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                color: ColorPicker.kGreyLight5,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                              borderRadius: BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset('assets/icons/fb.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD63B30),
                                              borderRadius: BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset('assets/icons/gp.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF04595B),
                                              borderRadius: BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset('assets/icons/x.png'),
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          child: Text('MEMBERS ONLY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.red)),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFECDCC),
                                            borderRadius: BorderRadius.circular(2),
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
                  Container(
                    height: 52,
                    width: 119,
                    child: Center(
                        child: Text(
                      'LOAD MORE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )),
                    decoration: BoxDecoration(color: Color(0xFF32A3FD), borderRadius: BorderRadius.circular(2)),
                  ),
                  SizedBox(height: 20),
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
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Item 2'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
  }

  Widget box({Color? color, String? image}) {
    return Container(
        height: Get.height * 0.06,
        width: Get.width * 0.17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: Get.height * 0.06,
                width: Get.width * 0.07,
                child: Image.asset(image!),
              ),
            )
          ],
        ));
  }

  Widget vector({String? image, String? title}) {
    return Row(
      children: [
        Image.asset(image!),
        Padding(
          padding: EdgeInsets.only(left: 4, top: 7),
          child: Text(title!,
              style: TextStyle(
                color: Color(0xff32A3FD),
                fontSize: 15,
              )),
        ),
        SizedBox(
          width: Get.width * 0.04,
        ),
      ],
    );
  }

  Widget tag({required String title, double? height, double? width}) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          child: Center(
            child: Text(title,
                style: TextStyle(
                  color: Color(0xffB5BDC2),
                )),
          ),
          width: width,
          height: height,
          decoration: BoxDecoration(color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(3)),
        ));
  }
}
