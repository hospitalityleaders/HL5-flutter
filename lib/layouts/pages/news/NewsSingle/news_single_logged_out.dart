import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/common/common_widget.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/responsive/responsive.dart';

import 'package:holedo/common/common_widget.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/responsive/responsive.dart';

class NewsSingleLoggedOutScreen extends StatefulWidget {
  @override
  _NewsSingleLoggedOutScreenState createState() =>
      _NewsSingleLoggedOutScreenState();
}

class _NewsSingleLoggedOutScreenState extends State<NewsSingleLoggedOutScreen> {
  List data1 = [
    {
      'txt':
          "The Internet of Things: The Impact on the Travel and Hotel Industry",
      'img': "assets/images/p1.png",
    },
    {
      'txt':
          "On Social Media? Maestro PMS Gives Operators, Guests Direct Social Media Booking",
      'img': "assets/images/p2.png",
    },
    {
      'txt':
          "Hotel Equities to Operate Two Premium-branded Hotels in Northeast",
      'img': "assets/images/p3.png",
    },
    {
      'txt':
          "The Internet of Things: The Impact on the Travel and Hotel Industry",
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
      'text1':
          'Mantra Group Reports Total Revenue Increase of 9.7% for Year Ending June 2015',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t3.png',
      'text1':
          'How Technology Can Deliver a Seamless Travel Experience - Information Age',
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
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t7.png',
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'By: Pam Carrol • 26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t8.png',
      'text1':
          'Hotel Price Index Reveals Midwest, Southwest and Western Cities Are Surging Domestically',
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
    {'img': "assets/icons/fb.png", 'color': const Color(0xFF344F8D)},
    {'img': "assets/icons/twitter.png", 'color': const Color(0xFF00ABF0)},
    {'img': "assets/icons/gp.png", 'color': const Color(0xFFD63B30)},
    {'img': "assets/icons/linkdin.png", 'color': const Color(0xFF1C86BC)},
    {'img': "assets/icons/x.png", 'color': const Color(0xFF04595B)},
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
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    // CarouselController buttonCarouselController = CarouselController();

    // debugPrint('${Get.width}');
    return Responsive.isDesktop(context)
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(46),
              child: Container(
                height: 46,
                color: ColorPicker.kPrimaryLight1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image(
                        image: AssetImage('assets/icons/logo1.png'),
                      ),
                    ),
                    SB.SW10(),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Container(
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        color: ColorPicker.kWhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.all(3),
                      child: TextFormField(
                        cursorColor: ColorPicker.kWhite,
                        style: FontTextStyle.kWhite16W400SSP,
                        decoration: InputDecoration(
                          hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          filled: true,
                          fillColor: ColorPicker.kPrimaryLight,
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorPicker.kPrimary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorPicker.kPrimary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorPicker.kPrimary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: ColorPicker.kPrimaryLightBlue,
                          ),
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(
                                right: 5, bottom: 5, top: 5),
                            height: 40,
                            width: Get.width * 0.045,
                            decoration: BoxDecoration(
                              color: ColorPicker.kPrimaryLight1,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: CommonWidget.text(
                                'People',
                                style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    SizedBox(
                      width: 380,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonWidget.text(
                            'Home',
                            style: FontTextStyle.kWhite16W400SSP,
                          ),
                          CommonWidget.text(
                            'Profile',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'News',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'Jobs',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'Recruitment',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'Help',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Container(
                      width: Get.width * 0.05,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                          right: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          //overflow: Overflow.visible,
                          children: [
                            const Icon(
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
                                  child: CommonWidget.text(
                                    '2',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.05,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          //overflow: Overflow.visible,
                          children: [
                            const Icon(
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
                                  child: CommonWidget.text(
                                    '2',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 90,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person_add,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff546088),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: CommonWidget.text(
                                  '352',
                                  style: FontTextStyle.kPrimaryLight10W700SSP,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.05,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: const Image(
                            image: AssetImage('assets/images/avatar.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///===1st Container =====
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    color: const Color(0xffCCE8FE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.25,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: CommonWidget.text(
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
                          decoration: BoxDecoration(
                            color: const Color(0xff32A3FD),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: CommonWidget.text(
                              "Join now. It’s free",
                              style: FontTextStyle.kWhite12W400PR,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.25,
                        ),
                      ],
                    ),
                  ),

                  Stack(
                    //overflow: Overflow.visible,
                    children: [
                      Container(
                        height: Get.height * 0.5,
                        width: Get.width,
                        // color: Colors.green,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/slider1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.03,
                              width: Get.width,
                              color: ColorPicker.kGreyLight5.withOpacity(0.1),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 120.0,
                                    top: 7,
                                  ),
                                  child: CommonWidget.text(
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
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(bottom: BorderSide(width: 0.1)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonWidget.text(
                                  "RESOURCES",
                                  style: FontTextStyle.kGreyLight510W700PR,
                                ),
                                SizedBox(
                                  height: Get.height * 0.005,
                                ),
                                CommonWidget.text(
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
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/avatar.png",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.009,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonWidget.text(
                                          "By: Pam Carrol",
                                          style:
                                              FontTextStyle.kGreyLight515W600PR,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.005,
                                        ),
                                        CommonWidget.text(
                                          "26 August 2015   •   10:40",
                                          style:
                                              FontTextStyle.kGreyLight515W600PR,
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
                              child: CommonWidget.text(
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
                              child: CommonWidget.text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n  \nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\n\n n Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
                                style: FontTextStyle.kGreyLight516W400SSP,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            CommonWidget.text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                              style: FontTextStyle.kGreyLight516W400SSP,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            CommonWidget.text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                              style: FontTextStyle.kGreyLight516W400SSP,
                            ),
                            SB.SH20(),
                            CommonWidget.blueDarkSignUp(),
                            SB.SH20(),
                            CommonWidget.text(
                              'TAGS:',
                              style: FontTextStyle.kGreyLight516W400SSP,
                            ),
                            SB.SH20(),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: List.generate(
                                  5,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 26,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffF6F7F8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Align(
                                        child: CommonWidget.text(
                                          '#Hospitality',
                                          style: FontTextStyle
                                              .kGreyLight614W400SSP,
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
                                    color: ColorPicker.kGreyLight5
                                        .withOpacity(0.2),
                                  ),
                                ),
                                CommonWidget.text(
                                  'SUGGESTED NEWS',
                                  style: FontTextStyle.kGreyLight513W700SSP,
                                ),
                                Flexible(
                                  child: Divider(
                                    indent: 10,
                                    color: ColorPicker.kGreyLight5
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ),
                            SB.SH20(),
                            SizedBox(
                              height: 400,
                              // width: 400,
                              child: ListView.builder(
                                itemCount: suggestNewsData.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: 400,
                                    width: 400,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            '${suggestNewsData[index]['img']}',
                                          ),
                                          height: 200,
                                          width: 400,
                                          fit: BoxFit.cover,
                                        ),
                                        Flexible(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CommonWidget.text(
                                                  '${suggestNewsData[index]['text1']}',
                                                  style: FontTextStyle
                                                      .kBlueDark118W700SSP,
                                                ),
                                                CommonWidget.text(
                                                  '${suggestNewsData[index]['text3']}',
                                                  style: FontTextStyle
                                                      .kGreyLight514W600SSP,
                                                ),
                                                if (suggestNewsData[index]
                                                        ['text2']
                                                    .toString()
                                                    .isEmpty)
                                                  SizedBox()
                                                else
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    child: CommonWidget.text(
                                                      'MEMBERS ONLY',
                                                      style: FontTextStyle
                                                          .kRed210W700SSP,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorPicker.kRedlight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
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
                        padding: const EdgeInsets.only(
                          left: 100,
                          bottom: 420,
                          right: 70,
                        ),
                        child: Column(
                          children: [
                            SB.SH20(),
                            CommonWidget.blueLightSignUp(),
                            SB.SH20(),
                            SizedBox(
                              height: 290,
                              width: Get.width,
                              child: const Image(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/Bannerimage.png'),
                              ),
                            ),
                            SB.SH20(),
                            CommonWidget.categoriesDesktop(),
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
              preferredSize: const Size.fromHeight(46),
              child: Container(
                height: 46,
                color: ColorPicker.kPrimaryLight1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image(
                        image: AssetImage('assets/icons/logo1.png'),
                      ),
                    ),
                    SB.SW10(),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Container(
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        color: ColorPicker.kWhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.all(3),
                      child: TextFormField(
                        cursorColor: ColorPicker.kWhite,
                        style: FontTextStyle.kWhite16W400SSP,
                        decoration: InputDecoration(
                          hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          filled: true,
                          fillColor: ColorPicker.kPrimaryLight,
                          hintText: "Search",
                          prefixIcon: const Icon(
                            Icons.search,
                            color: ColorPicker.kPrimaryLightBlue,
                          ),
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 40,
                            width: Get.width * 0.045,
                            decoration: BoxDecoration(
                              color: ColorPicker.kPrimaryLight1,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: CommonWidget.text(
                                'People',
                                style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    SizedBox(
                      width: 380,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonWidget.text(
                            'Home',
                            style: FontTextStyle.kWhite16W400SSP,
                          ),
                          CommonWidget.text(
                            'Profile',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'News',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'Jobs',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'Recruitment',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                          CommonWidget.text(
                            'Help',
                            style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Container(
                      width: Get.width * 0.05,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          //overflow: Overflow.visible,
                          children: [
                            const Icon(
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
                                  child: CommonWidget.text(
                                    '2',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.05,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          //overflow: Overflow.visible,
                          children: [
                            const Icon(
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
                                  child: CommonWidget.text(
                                    '2',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 90,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person_add,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff546088),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: CommonWidget.text(
                                  '352',
                                  style: FontTextStyle.kPrimaryLight10W700SSP,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.05,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: const Image(
                            image: AssetImage('assets/images/avatar.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: ColorPicker.kBg1,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.width * 0.8,
                    width: Get.width,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        debugPrint('-value----$value');
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

                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/slider1.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonWidget.text(
                                'RESOURCES',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: Get.width * 0.02),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CommonWidget.text(
                                  '5 Steps for Travel Brands to Build a Brand Ambassador Program',
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: Get.width * 0.02),
                              RichText(
                                text: const TextSpan(
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
                              CommonWidget.text(
                                '26 August 2015 • 10:40',
                                style: const TextStyle(
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
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 1),
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
                          backgroundColor: index == 1
                              ? ColorPicker.kBlueLight
                              : const Color(0xFFB5BDC2),
                        );
                      },
                    ),
                  ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Hotels and resorts',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Food and beverage',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Spa',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Tourism',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Apartments',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Tours',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Leisure',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          'Boutique Hotels',
                          style: FontTextStyle.kBlueLight114W400SSP,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: 200,
                        child: CommonWidget.text(
                          '+ Show more',
                          style: FontTextStyle.kBlueLight114W600SSP,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    // height: Get.height,
                    width: Get.width,
                    color: ColorPicker.kPrimaryLight,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: SizedBox(
                            // height: Get.height * 0.3,
                            width: Get.width * 0.3,
                            child: const Image(
                              image: AssetImage('assets/images/round.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.08,
                            vertical: Get.width * 0.15,
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
                                        const Icon(
                                          Icons.apartment_rounded,
                                          color: Color(0xFF546088),
                                        ),
                                        Container(
                                          width: 2,
                                          height: Get.height * 0.09,
                                          color: const Color(0xFF546088),
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
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'Get priority news access',
                                          style: const TextStyle(
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
                              SB.SH10(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.verified,
                                        color: Color(0xFF546088),
                                      ),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: const Color(0xFF546088),
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
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'Stay up to date with news from the tourism and hospitality industry.',
                                          style: const TextStyle(
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
                              SB.SH10(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.verified,
                                        color: Color(0xFF546088),
                                      ),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: const Color(0xFF546088),
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
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'I’ts gathered from hundreds of trusted sources and updates in real time.',
                                          style: const TextStyle(
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
                              SB.SH10(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.verified,
                                        color: Color(0xFF546088),
                                      ),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: const Color(0xFF546088),
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
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CommonWidget.text(
                                          'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
                                          style: const TextStyle(
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
                                      const SizedBox(width: 24),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: const Color(0xFF546088),
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
                                          const Icon(
                                            Icons.person_add,
                                            size: 15,
                                          ),
                                          CommonWidget.text(
                                            'Sign up now. It’s free',
                                            style: const TextStyle(
                                              color: ColorPicker.kGreyLight5,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                    children: const [
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
                                        child: CommonWidget.text(
                                          'OR IMPORT YOUR DETAILS FROM',
                                          style: const TextStyle(
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
                              SB.SH10(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 24),
                                      Container(
                                        width: 2,
                                        height: Get.height * 0.078,
                                        color: const Color(0xFF546088),
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
                                              color: const Color(0xFF344F8D),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                'assets/icons/fb.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD63B30),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                'assets/icons/gp.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF04595B),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                'assets/icons/x.png',
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
                  const SizedBox(height: 20),
                  ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
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
                                    CommonWidget.text(
                                      '${data[index]['text1']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    CommonWidget.text(
                                      '${data[index]['text3']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPicker.kGreyLight5,
                                      ),
                                    ),
                                    if (data[index]['text2'].toString().isEmpty)
                                      SizedBox()
                                    else
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: CommonWidget.text('MEMBERS ONLY',
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 52,
                    width: 119,
                    decoration: BoxDecoration(
                      color: const Color(0xFF32A3FD),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                        child: CommonWidget.text(
                      'LOAD MORE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    height: Get.width * 0.8,
                    width: Get.width,
                    color: Colors.white,
                    child: const Image(
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
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: CommonWidget.text('Drawer Header'),
                  ),
                  ListTile(
                    title: CommonWidget.text('Item 1'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: CommonWidget.text('Item 2'),
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
      ),
    );
  }

  Widget vector({String? image, String? title}) {
    return Row(
      children: [
        Image.asset(image!),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 7),
          child: CommonWidget.text(
            title!,
            style: const TextStyle(
              color: Color(0xff32A3FD),
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.04,
        ),
      ],
    );
  }

  Widget tag({required String title, double? height, double? width}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: CommonWidget.text(title,
              style: TextStyle(
                color: Color(0xffB5BDC2),
              )),
        ),
      ),
    );
  }
}
