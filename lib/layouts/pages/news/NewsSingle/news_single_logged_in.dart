import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/common/common_widget.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/responsive/responsive.dart';

class NewsSingleLoggedInScreen extends StatefulWidget {
  static const String route = '/category_details';
  @override
  _NewsSingleLoggedInScreenState createState() =>
      _NewsSingleLoggedInScreenState();
}

class _NewsSingleLoggedInScreenState extends State<NewsSingleLoggedInScreen> {
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
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t2.png',
      'text1':
          'Mantra Group Reports Total Revenue Increase of 9.7% for Year Ending June 2015',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t3.png',
      'text1':
          'How Technology Can Deliver a Seamless Travel Experience - Information Age',
      'text2': 'MEMBERS ONLY',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t4.png',
      'text1': 'Baha Mar Files Chapter 11 Plan of Reorganization',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t5.png',
      'text1': 'The Quincy Hotel in Downtown Washington D.C. Sold to RLHC JV',
      'text2': 'MEMBERS ONLY',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t6.png',
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t7.png',
      'text1':
          'Welk Resorts Reports Increased Revenue and Plans for Two New Properties',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t8.png',
      'text1':
          'Hotel Price Index Reveals Midwest, Southwest and Western Cities Are Surging Domestically',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t9.png',
      'text1': 'MainStay Suites Hotel Sydney Opens in Montana',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t10.png',
      'text1': 'California raisin’ prices as deal volume drops',
      'text2': '',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
    },
    {
      'img': 'assets/images/t2.png',
      'text1': 'Hotel Industry Opposes NLRB Joint-Employer Decision',
      'text2': 'MEMBERS ONLY',
      'text3': 'Pam Carrol',
      'text4': '26 August 2015 • 10:40',
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

    debugPrint('${Get.width}');
    return Responsive.isDesktop(context) ? desktopView() : mobileVew(context);
  }

  Scaffold mobileVew(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.kBg1,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 120),
                    child: SizedBox(
                      width: Get.width,
                      child: Image.asset(
                        'assets/images/slider1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.width * 0.28,
                    child: Container(
                      width: Get.width * 0.92,
                      height: Get.height * 0.4,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidget.text(
                              'RESOURCES',
                              style: FontTextStyle.kGreyLight512W700SSP,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            CommonWidget.text(
                              '5 Steps for Travel Brands to Build a Brand Ambassador Program',
                              style: FontTextStyle.kBlueDark126W400SSP,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/profile.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CommonWidget.text(
                                            'By',
                                            style: const TextStyle(
                                              fontSize: 17,
                                              color: ColorPicker.kGreyLight5,
                                            ),
                                          ),
                                          CommonWidget.text(
                                            ': Pam Carrol',
                                            style: const TextStyle(
                                              color: ColorPicker.kGreyLight5,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.005,
                                      ),
                                      CommonWidget.text(
                                        '26 August 2015 • 10:40',
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: ColorPicker.kGreyLight5,
                                        ),
                                      ),
                                    ],
                                  ),
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
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                right: 7,
                                left: 7,
                                bottom: 20,
                              ),
                              child: Divider(
                                color: Color(0xffDEE1E3),
                                thickness: 2,
                              ),
                            ),
                            CommonWidget.text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CommonWidget.text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                              style: const TextStyle(
                                color: ColorPicker.kGreyLight5,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CommonWidget.text(
                              'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                              style: const TextStyle(
                                color: ColorPicker.kGreyLight5,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CommonWidget.text(
                              'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                              style: const TextStyle(
                                color: ColorPicker.kGreyLight5,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),

                            Container(
                              height: Get.height * 0.5,
                              // width: 712,

                              color: const Color(0xffF6F7F8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: SizedBox(
                                      // color: Colors.red,
                                      // height: 332,
                                      width: Get.width,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          PageView.builder(
                                            controller: _controller,
                                            onPageChanged: (value) {
                                              debugPrint(
                                                '-value----${_controller.page}',
                                              );
                                              setState(() {
                                                // currentIndex = value;
                                              });
                                            },
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                // height: Get.width,
                                                width: Get.width,
                                                // width: 200,

                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/slider2.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                                // child: Image(
                                                //   image: AssetImage('image/25-3/cover_image.png'),
                                                //   fit: BoxFit.fitHeight,
                                                // ),
                                              );
                                            },
                                          ),
                                          Positioned(
                                            left: 0,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              color: const Color(0xFF272E41)
                                                  .withOpacity(0.4),
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: () {
                                                    _controller.previousPage(
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      curve: Curves.easeIn,
                                                    );
                                                    // Use the controller to change the current page
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
                                              color: const Color(0xFF272E41)
                                                  .withOpacity(0.4),
                                              child: Center(
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      // Use the controller to change the current page
                                                      _controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                          seconds: 1,
                                                        ),
                                                        curve: Curves.easeIn,
                                                      );
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          width: Get.width,
                                          // color: Colors.green,
                                          child: ListView.builder(
                                            itemCount: data.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Container(
                                                  height: 80,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        "${data[index]['img']}",
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Container(
                                            width: 30,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            child: const Icon(
                                              Icons.chevron_right,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///
                            // Container(
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       border: Border.all(
                            //           width: 6, color: Color(0xffF6F7F8)),
                            //       boxShadow: [
                            //         BoxShadow(
                            //             blurRadius: 2,
                            //             color: Color(0xffBDC4C7),
                            //             offset: Offset(0, 4))
                            //       ]),
                            //   child: Column(
                            //     children: [
                            //       Image.asset(
                            //           'assets/images/slider2.png'),
                            //       SizedBox(
                            //         height: Get.height * 0.003,
                            //       ),
                            //       Row(
                            //         children: [
                            //           Container(
                            //             height: Get.height * 0.1,
                            //             width: Get.width * 0.23,
                            //             child: Image.asset(
                            //               'assets/images/l1.png',
                            //               fit: BoxFit.cover,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: Get.width * 0.008,
                            //           ),
                            //           Container(
                            //             height: Get.height * 0.1,
                            //             width: Get.width * 0.23,
                            //             child: Image.asset(
                            //               'assets/images/l2.png',
                            //               fit: BoxFit.cover,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: Get.width * 0.008,
                            //           ),
                            //           Container(
                            //             height: Get.height * 0.1,
                            //             width: Get.width * 0.23,
                            //             child: Image.asset(
                            //               'assets/images/l3.png',
                            //               fit: BoxFit.cover,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: Get.width * 0.008,
                            //           ),
                            //           Container(
                            //               height: Get.height * 0.1,
                            //               width: Get.width * 0.14,
                            //               decoration: BoxDecoration(
                            //                   image: DecorationImage(
                            //                       image: AssetImage(
                            //                         'assets/images/l4.png',
                            //                       ),
                            //                       fit: BoxFit.cover)),
                            //               child: Padding(
                            //                 padding:
                            //                     EdgeInsets.only(left: 28),
                            //                 child: IconButton(
                            //                     onPressed: () {},
                            //                     icon: Icon(
                            //                       Icons.arrow_forward_ios,
                            //                       color: Colors.white,
                            //                       size: 12,
                            //                     )),
                            //               )),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CommonWidget.text(
                              'Lorem ipsum dolor sit amet',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CommonWidget.text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                              style: const TextStyle(
                                color: ColorPicker.kGreyLight5,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CommonWidget.text(
                              'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                              style: const TextStyle(
                                color: ColorPicker.kGreyLight5,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            CommonWidget.text(
                              'Numbered List',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: CommonWidget.text(
                                    '1.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                SizedBox(
                                  width: Get.height * 0.37,
                                  child: CommonWidget.text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: CommonWidget.text(
                                    '2.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                SizedBox(
                                  width: Get.height * 0.37,
                                  child: CommonWidget.text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: CommonWidget.text(
                                    '3.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                SizedBox(
                                  width: Get.height * 0.37,
                                  child: CommonWidget.text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            CommonWidget.text(
                              'Bulleted List',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: CommonWidget.text(
                                    '•',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                SizedBox(
                                  width: Get.height * 0.37,
                                  child: CommonWidget.text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: CommonWidget.text(
                                    '•',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                SizedBox(
                                  width: Get.height * 0.37,
                                  child: CommonWidget.text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  child: CommonWidget.text(
                                    '•',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                SizedBox(
                                  width: Get.height * 0.37,
                                  child: CommonWidget.text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                    style: const TextStyle(
                                      color: ColorPicker.kGreyLight5,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 150),
                                  child: Image.asset('assets/icons/invot1.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: Get.height * 0.36,
                                    child: CommonWidget.text(
                                      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: Image.asset('assets/icons/invot.png'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            CommonWidget.text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                              style: const TextStyle(
                                color: ColorPicker.kGreyLight5,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            CommonWidget.text(
                              'TAGS:',
                              style: const TextStyle(
                                color: Color(0xffB5BDC2),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              height: Get.height * 0.13,
                              width: Get.width * 0.9,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      tag(
                                        title: '#Hospital',
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.2,
                                      ),
                                      tag(
                                        title: '#Brand',
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.16,
                                      ),
                                      tag(
                                        title: '#Ambassador',
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.25,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      tag(
                                        title: '#Hotal',
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.16,
                                      ),
                                      tag(
                                        title: '#Icon',
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.15,
                                      ),
                                      tag(
                                        title: '#Travel',
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            CommonWidget.text(
                              'SHARE THIS ARTICLE:',
                              style: const TextStyle(
                                color: Color(0xffB5BDC2),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                box(
                                  color: const Color(0xff04595B),
                                  image: 'assets/icons/x.png',
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                box(
                                  color: const Color(0xff1C86BC),
                                  image: 'assets//icons/linkdin.png',
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                box(
                                  color: const Color(0xffD63B30),
                                  image: 'assets/icons/gp.png',
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                box(
                                  color: const Color(0xff00ABF0),
                                  image: 'assets/icons/twitter.png',
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                box(
                                  color: const Color(0xff344F8D),
                                  image: 'assets/icons/fb.png',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.015,
                            ),
                            const Divider(
                              thickness: 2,
                              color: Color(0xffDEE1E3),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                likeCommentShare.length,
                                (index) => Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        likeCommentShare[index]['img']
                                            as String,
                                      ),
                                      height: 15,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 5),
                                    CommonWidget.text(
                                      likeCommentShare[index]['title']
                                          as String,
                                      style: FontTextStyle.kBlueLight116W400SSP,
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFCCE8FE),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: CommonWidget.text(
                                          likeCommentShare[index]['total']
                                              as String,
                                          style:
                                              FontTextStyle.kBlueLight112W700PR,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color(0xffDEE1E3),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/icons/comment.png'),
                            height: 15,
                            width: 16,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 5),
                          CommonWidget.text(
                            'Show previous comments',
                            style: FontTextStyle.kBlueLight114W600PR,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/avatar.png',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "Jad Limacino",
                                              style: FontTextStyle
                                                  .kBlackPure16W600PR,
                                              children: const <TextSpan>[
                                                TextSpan(
                                                  text: 'MHL',
                                                  style: TextStyle(
                                                    textBaseline: TextBaseline
                                                        .ideographic,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "  Very interesting indeed. I’ll be watching this very closely as they expand further into Asia.",
                                                  style: TextStyle(
                                                    textBaseline: TextBaseline
                                                        .ideographic,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CommonWidget.text(
                                              'like • ',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 14,
                                              ),
                                            ),
                                            CommonWidget.text(
                                              'Reply • ',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.thumb_up_alt,
                                              color: Colors.blue,
                                            ),
                                            CommonWidget.text(
                                              ' 12',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 14,
                                              ),
                                            ),
                                            CommonWidget.text(
                                              ' • 5 hours ago',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              'assets/images/avatar.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.01,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.4,
                                            child: RichText(
                                              text: const TextSpan(
                                                text: "Jad Limacino",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' MHL',
                                                    style: TextStyle(
                                                      textBaseline: TextBaseline
                                                          .ideographic,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "  Very interesting indeed. I’ll be watching this very closely as they expand further into Asia.",
                                                    style: TextStyle(
                                                      textBaseline: TextBaseline
                                                          .ideographic,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CommonWidget.text(
                                                'like • ',
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              CommonWidget.text(
                                                'Reply • ',
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.thumb_up_alt,
                                                color: Colors.blue,
                                              ),
                                              CommonWidget.text(
                                                ' 12',
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              CommonWidget.text(
                                                ' • 5 hours ago',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/avatar.png',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Container(
                                  // height: 40,
                                  // width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xFFDEE1E3),
                                    ),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      border: InputBorder.none,
                                      hintText: 'Leave a comment',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 2,
                        color: Color(0xffDEE1E3),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                    child: Divider(
                      endIndent: 10,
                      color: ColorPicker.kGreyLight5.withOpacity(0.2),
                    ),
                  ),
                  CommonWidget.text(
                    'SUGGESTED NEWS',
                    style: FontTextStyle.kGreyLight513W700PR,
                  ),
                  Flexible(
                    child: Divider(
                      indent: 10,
                      color: ColorPicker.kGreyLight5.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 300,
                // width: 400,
                child: ListView.builder(
                  itemCount: suggestNewsData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      height: 300,
                      width: 400,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image:
                                AssetImage('${suggestNewsData[index]['img']}'),
                            height: 200,
                            width: 400,
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
                                    '${suggestNewsData[index]['text1']}',
                                    style: FontTextStyle.kBlackPure18W700PR,
                                  ),
                                  CommonWidget.text(
                                    '${suggestNewsData[index]['text3']}',
                                    style: FontTextStyle.kGreyLight514W600PR,
                                  ),
                                  if (suggestNewsData[index]['text2']
                                      .toString()
                                      .isEmpty)
                                    SizedBox()
                                  else
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: CommonWidget.text(
                                        'MEMBERS ONLY',
                                        style: FontTextStyle.kRed10W400PR,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFECDCC),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            height: 0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SB.SH20(),
              Container(
                alignment: Alignment.center,
                height: 15,
                width: Get.width,
                // color: Colors.red,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 8,
                        // foregroundColor: Colors.red,
                        backgroundColor: index == 0
                            ? const Color(0xFF33A3FE)
                            : const Color(0xFF33A3FE).withOpacity(0.19),
                      ),
                    );
                  },
                ),
              ),
              SB.SH20(),
              Container(
                height: 310,
                width: Get.width,
                color: ColorPicker.kBlueLight3,
                child: Stack(
                  children: [
                    Positioned(
                      top: -1,
                      left: 0,
                      child: SizedBox(
                        // height: Get.height * 0.3,
                        width: 100,
                        child: const Image(
                          image: AssetImage('assets/images/round2.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 40,
                        bottom: 10,
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
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 2,
                                      height: 100,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: 30),
                                  CommonWidget.text(
                                    'GOT NEWS ?',
                                    style: FontTextStyle.kWhite12W700SSP,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.34,
                                    child: CommonWidget.text(
                                      'Become a thought leader on hospitality',
                                      style: FontTextStyle.kWhite24W400PR,
                                    ),
                                  ),
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
                                    const Icon(
                                      Icons.reduce_capacity_sharp,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 2,
                                      height: 43,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: 30),
                                  Container(
                                    height: 36,
                                    width: 205,
                                    color: const Color(0xffCCE8FE),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.message,
                                          color: Colors.blue,
                                          size: 10,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        CommonWidget.text(
                                          "Send news to our editor",
                                          style: FontTextStyle
                                              .kBlueLight116W400SSP,
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
              SB.SH20(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ColorPicker.kBorder1),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget.text(
                      'Categories',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/menu.png'),
                        const SizedBox(height: 3),
                        CommonWidget.text(
                          'menu',
                          style: const TextStyle(
                            fontSize: 9,
                            color: ColorPicker.kBlueLight1,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SB.SH20(),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonWidget.text(
                            'Latest news',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          Container(
                            padding: EdgeInsets.all(Get.width * 0.01),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image(
                                      image:
                                          AssetImage('${data1[index]['img']}'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: CommonWidget.text(
                                      '${data1[index]['txt']}',
                                      style: FontTextStyle.kBlackPure16W700PR,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SB.SH20(),
              Container(
                height: 290,
                width: Get.width,
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/Bannerimage.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SB.SH20(),
            ],
          ),
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

  Scaffold desktopView() {
    return Scaffold(
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
                  // SizedBox(
                  //   width: Get.width * 0.25,
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Center(
                      child: CommonWidget.text(
                        "New to Hospitality Leaders? Sign up now to join our membership",
                        style: FontTextStyle.kBlueLight116W400SSP,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: Get.height * 0.032,
                    // width: Get.width * 0.08,
                    decoration: BoxDecoration(
                      color: const Color(0xff32A3FD),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: CommonWidget.text(
                        "Join now. It’s free",
                        style: FontTextStyle.kWhite14W400SSP,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: Get.width * 0.25,
                  // ),
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
                        height: 30,
                        width: Get.width,
                        color: const Color(0xff272E41).withOpacity(0.25),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: CommonWidget.text(
                              "Send news to: editor@hospitality.pro ",
                              style: FontTextStyle.kWhite14W400SSP,
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
                    // height: Get.height * 0.22,
                    width: Get.width * 0.6,
                    decoration: const BoxDecoration(
                      color: ColorPicker.kWhite,
                      border: Border(
                        bottom: BorderSide(
                          color: ColorPicker.kGreyLight8,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidget.text(
                            "RESOURCES",
                            style: FontTextStyle.kGreyLight512W700SSP,
                          ),
                          SizedBox(
                            height: Get.height * 0.005,
                          ),
                          CommonWidget.text(
                            "5 Steps for Travel Brands to Build a Brand Ambassador Program",
                            style: FontTextStyle.kBlueDark136W400SSP,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "By: ",
                                      style: FontTextStyle.kGreyLight514W400SSP,
                                      children: [
                                        TextSpan(
                                          text: "Pam Carrol",
                                          style:
                                              FontTextStyle.kGreyLight514W600PR,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  CommonWidget.text(
                                    "26 August 2015  •  10:40",
                                    style: FontTextStyle.kGreyLight514W400SSP,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              SizedBox(
                                height: 20,
                                child: const VerticalDivider(
                                  // width: 2,
                                  thickness: 1,
                                  color: ColorPicker.kGreyLight6,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              SizedBox(
                                width: Get.width * 0.35,
                                // color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: ColorPicker.kBg3,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/svg/facebook.svg',
                                          height: 13,
                                          width: 13,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    CommonWidget.text(
                                      '112',
                                      style: FontTextStyle.kGreyLight514W400SSP,
                                    ),
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: ColorPicker.kBg3,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/svg/twitter.svg',
                                          height: 13,
                                          width: 13,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    CommonWidget.text(
                                      '56',
                                      style: FontTextStyle.kGreyLight514W400SSP,
                                    ),
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: ColorPicker.kBg3,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/svg/googleplus.svg',
                                          height: 13,
                                          width: 13,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    CommonWidget.text(
                                      '321',
                                      style: FontTextStyle.kGreyLight514W400SSP,
                                    ),
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: ColorPicker.kBg3,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/svg/linkdin.svg',
                                          height: 13,
                                          width: 13,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    CommonWidget.text(
                                      '22',
                                      style: FontTextStyle.kGreyLight514W400SSP,
                                    ),
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: ColorPicker.kBg3,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/svg/any.svg',
                                          height: 13,
                                          width: 13,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    CommonWidget.text(
                                      '13',
                                      style: FontTextStyle.kGreyLight514W400SSP,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
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
                        height: Get.height * 0.1,
                      ),
                      CommonWidget.text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quisnostrud exercitation ullamco.",
                        style: FontTextStyle.kBlueDark120W400SSP
                            .copyWith(height: 1.5),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonWidget.text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                        style: FontTextStyle.kGreyLight516W400SSP
                            .copyWith(height: 1.5),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonWidget.text(
                        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                        style: FontTextStyle.kGreyLight516W400SSP
                            .copyWith(height: 1.5),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonWidget.text(
                        "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
                        style: FontTextStyle.kGreyLight516W400SSP
                            .copyWith(height: 1.5),
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Container(
                        // height: 434,
                        // width: 712,
                        color: const Color(0xffF6F7F8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 332,
                              width: Get.width,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  PageView.builder(
                                    controller: _controller,
                                    onPageChanged: (value) {
                                      debugPrint(
                                          '-value----${_controller.page}');
                                      setState(() {
                                        // currentIndex = value;
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

                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/slider2.png',
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),

                                        // child: Image(
                                        //   image: AssetImage('image/25-3/cover_image.png'),
                                        //   fit: BoxFit.fitHeight,
                                        // ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      color: const Color(0xFF272E41)
                                          .withOpacity(0.4),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            _controller.previousPage(
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.easeIn,
                                            );
                                            // Use the controller to change the current page
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
                                      color: const Color(0xFF272E41)
                                          .withOpacity(0.4),
                                      child: Center(
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              // Use the controller to change the current page
                                              _controller.nextPage(
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.easeIn,
                                              );
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
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 2),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: Get.width,
                                    // color: Colors.green,
                                    child: ListView.builder(
                                      itemCount: data.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            height: 80,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "${data[index]['img']}",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 30,
                                      color: Colors.black.withOpacity(0.3),
                                      child: const Icon(
                                        Icons.chevron_right,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      const Divider(
                        color: ColorPicker.kGreyLight8,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonWidget.text(
                        'Lorem ipsum dolor sit amet',
                        style: FontTextStyle.kBlueDark118W700SSP
                            .copyWith(height: 1.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonWidget.text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                        style: FontTextStyle.kGreyLight516W400SSP
                            .copyWith(height: 1.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonWidget.text(
                        'Numbered List',
                        style: FontTextStyle.kBlueDark118W700SSP
                            .copyWith(height: 1.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        leading: CommonWidget.text(
                          '1.',
                          textAlign: TextAlign.start,
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                        title: CommonWidget.text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                      ),
                      ListTile(
                        leading: CommonWidget.text(
                          '2.',
                          textAlign: TextAlign.start,
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                        title: CommonWidget.text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                      ),
                      ListTile(
                        leading: CommonWidget.text(
                          '3.',
                          textAlign: TextAlign.start,
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                        title: CommonWidget.text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonWidget.text(
                        'Bulleted List',
                        style: FontTextStyle.kBlueDark118W700SSP
                            .copyWith(height: 1.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        leading: CommonWidget.text(
                          '\u2022',
                          textAlign: TextAlign.start,
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                        title: CommonWidget.text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                      ),
                      ListTile(
                        leading: CommonWidget.text(
                          '\u2022',
                          textAlign: TextAlign.start,
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                        title: CommonWidget.text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                      ),
                      ListTile(
                        leading: CommonWidget.text(
                          '\u2022',
                          textAlign: TextAlign.start,
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                        title: CommonWidget.text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: FontTextStyle.kGreyLight516W400SSP
                              .copyWith(height: 1.5),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 30,
                            child: CommonWidget.text(
                              '"',
                              style: FontTextStyle.kBlueLight150BOLDPR,
                            ),
                          ),
                          Flexible(
                            child: CommonWidget.text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex',
                              style: FontTextStyle.kBlueDark120W400SSP
                                  .copyWith(height: 1.5),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                            child: CommonWidget.text(
                              '"',
                              style: FontTextStyle.kBlueLight150BOLDPR,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonWidget.text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                        style: FontTextStyle.kGreyLight516W400SSP
                            .copyWith(height: 1.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonWidget.text(
                        'TAGS:',
                        style: FontTextStyle.kGreyLight612W700SSP
                            .copyWith(height: 1.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CommonWidget.text(
                                '#Hospitality',
                                style: FontTextStyle.kGreyLight614W400SSP
                                    .copyWith(height: 1.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SB.SH20(),
                      CommonWidget.text(
                        'Share This Article:',
                        style: FontTextStyle.kGreyLight612W700SSP
                            .copyWith(height: 1.5),
                      ),
                      SB.SH20(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: List.generate(
                            5,
                            (index) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 100,
                              height: 36,
                              decoration: BoxDecoration(
                                color: buttonData[index]['color'] as Color,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Image(
                                  image: AssetImage(
                                      '${buttonData[index]['img']}')),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        color: ColorPicker.kGreyLight8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                const Image(
                                  image: AssetImage('assets/icons/like.png'),
                                  height: 11,
                                  width: 10,
                                  fit: BoxFit.cover,
                                ),
                                SB.SW5(),
                                CommonWidget.text(
                                  'Like',
                                  style: FontTextStyle.kBlueLight114W400SSP
                                      .copyWith(height: 1.5),
                                ),
                                SB.SW5(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFCCE8FE),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: CommonWidget.text(
                                    '12',
                                    style: FontTextStyle.kBlueLight112W700SSP
                                        .copyWith(height: 1.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            // width: 100,
                            // height: 50,
                            // color: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                const Image(
                                  image: AssetImage('assets/icons/comment.png'),
                                  height: 11,
                                  width: 10,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 5),
                                CommonWidget.text(
                                  'Comment',
                                  style: FontTextStyle.kBlueLight114W400SSP
                                      .copyWith(height: 1.5),
                                ),
                                SB.SW5(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFCCE8FE),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: CommonWidget.text(
                                    '5',
                                    style: FontTextStyle.kBlueLight112W700SSP
                                        .copyWith(height: 1.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            // width: 100,
                            // height: 50,
                            // color: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.only(right: 20),
                            child: Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceEvenly,
                              children: [
                                const Image(
                                  image: AssetImage('assets/icons/share.png'),
                                  height: 11,
                                  width: 10,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 5),
                                CommonWidget.text(
                                  'Share',
                                  style: FontTextStyle.kBlueLight114W400SSP
                                      .copyWith(height: 1.5),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFCCE8FE),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: CommonWidget.text(
                                    '0',
                                    style: FontTextStyle.kBlueLight112W700SSP
                                        .copyWith(height: 1.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                        color: Color(0xFFDEE1E3),
                      ),
                      SB.SH20(),
                      Container(
                        // width: 100,
                        // height: 50,
                        // color: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/comment.png'),
                              height: 15,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 5),
                            CommonWidget.text(
                              'Show previous comments',
                              style: FontTextStyle.kBlueLight114W600SSP
                                  .copyWith(height: 1.5),
                            ),
                          ],
                        ),
                      ),
                      SB.SH20(),

                      ///Comment Section

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/avatar.png',
                                ),
                              ),
                            ),
                          ),
                          SB.SW20(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.4,
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Jad Limacino",
                                          style: FontTextStyle
                                              .kBlueDark116W700SSP
                                              .copyWith(height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' MHL',
                                              style: FontTextStyle
                                                  .kBlueDark112W700SSP
                                                  .copyWith(
                                                height: 1.5,
                                                textBaseline:
                                                    TextBaseline.ideographic,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "  Very interesting indeed. I’ll be watching this very closely as they expand further into Asia.",
                                              style: FontTextStyle
                                                  .kGreyLight516W400SSP
                                                  .copyWith(
                                                height: 1.5,
                                                textBaseline:
                                                    TextBaseline.ideographic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CommonWidget.text(
                                          'like • ',
                                          style: FontTextStyle
                                              .kBlueLight114W400SSP
                                              .copyWith(height: 1.5),
                                        ),
                                        CommonWidget.text(
                                          'Reply • ',
                                          style: FontTextStyle
                                              .kBlueLight114W400SSP
                                              .copyWith(height: 1.5),
                                        ),
                                        const Image(
                                          image: AssetImage(
                                            'assets/icons/like.png',
                                          ),
                                          height: 11,
                                          width: 10,
                                          fit: BoxFit.cover,
                                        ),
                                        CommonWidget.text(
                                          ' 12',
                                          style: FontTextStyle
                                              .kBlueLight114W400SSP
                                              .copyWith(height: 1.5),
                                        ),
                                        CommonWidget.text(
                                          ' • 5 hours ago',
                                          style: FontTextStyle
                                              .kGreyLight614W400SSP
                                              .copyWith(height: 1.5),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/avatar.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.4,
                                        child: RichText(
                                          text: TextSpan(
                                            text: "Jad Limacino",
                                            style: FontTextStyle
                                                .kBlueDark116W700SSP
                                                .copyWith(height: 1.5),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' MHL',
                                                style: FontTextStyle
                                                    .kBlueDark112W700SSP
                                                    .copyWith(
                                                  height: 1.5,
                                                  textBaseline:
                                                      TextBaseline.ideographic,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "  Definetely.",
                                                style: FontTextStyle
                                                    .kGreyLight516W400SSP
                                                    .copyWith(
                                                  height: 1.5,
                                                  textBaseline:
                                                      TextBaseline.ideographic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CommonWidget.text(
                                            'Like',
                                            style: FontTextStyle
                                                .kBlueLight114W400SSP
                                                .copyWith(height: 1.5),
                                          ),
                                          CommonWidget.text(
                                            ' • ',
                                            style: FontTextStyle
                                                .kGreyLight614W400SSP
                                                .copyWith(height: 1.5),
                                          ),
                                          CommonWidget.text(
                                            'Reply',
                                            style: FontTextStyle
                                                .kBlueLight114W400SSP
                                                .copyWith(height: 1.5),
                                          ),
                                          // Icon(
                                          //   Icons.thumb_up_alt,
                                          //   color: Colors.blue,
                                          // ),
                                          // CommonWidget.text(
                                          //   ' 12',
                                          //   style: TextStyle(
                                          //       color: Colors.blue,
                                          //       fontSize: 14),
                                          // ),
                                          CommonWidget.text(
                                            '  •  5 hours ago',
                                            style: FontTextStyle
                                                .kGreyLight614W400SSP
                                                .copyWith(height: 1.5),
                                          ),
                                        ],
                                      ),
                                      SB.SH20(),
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/avatar.png',
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          SB.SW20(),
                          Flexible(
                            child: Container(
                              // height: 40,
                              // width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: const Color(0xFFDEE1E3)),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  border: InputBorder.none,
                                  hintStyle: FontTextStyle.kGreyLight514W400SSP,
                                  hintText: 'Leave a comment',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      SB.SH10(),
                      const Divider(
                          thickness: 2, color: ColorPicker.kGreyLight10),
                      SB.SH20(),
                      Row(
                        children: [
                          Flexible(
                            child: Divider(
                              endIndent: 10,
                              color: ColorPicker.kGreyLight5.withOpacity(0.2),
                            ),
                          ),
                          CommonWidget.text(
                            'SUGGESTED NEWS',
                            style: FontTextStyle.kGreyLight513W700SSP
                                .copyWith(height: 1.5),
                          ),
                          Flexible(
                            child: Divider(
                              indent: 10,
                              color: ColorPicker.kGreyLight5.withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                      SB.SH20(),
                      // SizedBox(
                      //   height: 20,
                      // ),
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
                              color: ColorPicker.kWhite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      '${suggestNewsData[index]['img']}',
                                    ),
                                    height: 200,
                                    width: 400,
                                    fit: BoxFit.cover,
                                  ),
                                  SB.SH10(),
                                  Flexible(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonWidget.text(
                                            '${suggestNewsData[index]['text1']}',
                                            style: FontTextStyle
                                                .kBlueDark118W700SSP
                                                .copyWith(height: 1.5),
                                          ),
                                          SB.SH10(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: "By: ",
                                                  style: FontTextStyle
                                                      .kGreyLight514W400SSP
                                                      .copyWith(height: 1.5),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${suggestNewsData[index]['text3']}',
                                                      style: FontTextStyle
                                                          .kGreyLight514W600SSP
                                                          .copyWith(
                                                              height: 1.5),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.005,
                                              ),
                                              CommonWidget.text(
                                                "26 August 2015  •  10:40",
                                                style: FontTextStyle
                                                    .kGreyLight514W400SSP
                                                    .copyWith(height: 1.5),
                                              )
                                            ],
                                          ),

                                          // CommonWidget.text(
                                          //   '${suggestNewsData[index]['text3']}',
                                          //   style: FontTextStyle
                                          //       .kGreyLight514W600PR,
                                          // ),
                                          // suggestNewsData[index]['text2']
                                          //         .toString()
                                          //         .isEmpty
                                          //     ? SizedBox()
                                          //     : Container(
                                          //         padding:
                                          //             EdgeInsets.all(5),
                                          //         child: CommonWidget.text(
                                          //           'MEMBERS ONLY',
                                          //           style: FontTextStyle
                                          //               .kRed10W400PR,
                                          //         ),
                                          //         decoration: BoxDecoration(
                                          //           color:
                                          //               Color(0xFFFECDCC),
                                          //           borderRadius:
                                          //               BorderRadius
                                          //                   .circular(2),
                                          //         ),
                                          //       ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    color: ColorPicker.kGreyLight10,
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
                  padding:
                      const EdgeInsets.only(left: 100, bottom: 420, right: 70),
                  child: Column(
                    children: [
                      SB.SH20(),
                      Container(
                        height: 325,
                        width: Get.width,
                        color: ColorPicker.kBlueLight3,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -1,
                              left: 0,
                              child: SizedBox(
                                // height: Get.height * 0.3,
                                width: 100,
                                child: const Image(
                                  image: AssetImage('assets/images/round2.png'),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 40,
                                bottom: 10,
                              ),
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
                                            const Icon(
                                              Icons.apartment_rounded,
                                              // color: Colors.white,
                                              color: ColorPicker.kWhite,
                                            ),
                                            Container(
                                              width: 2,
                                              height: 150,
                                              color: ColorPicker.kWhite,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(height: 30),
                                          CommonWidget.text(
                                            'TIMELINE',
                                            style:
                                                FontTextStyle.kWhite12W700SSP,
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.16,
                                            child: CommonWidget.text(
                                              'Become a thought leader on hospitality',
                                              style: FontTextStyle
                                                  .kBlueLight236W400SSP,
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
                                      IntrinsicWidth(
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.reduce_capacity_sharp,
                                              color: ColorPicker.kWhite,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 2,
                                              height: 20,
                                              color: ColorPicker.kWhite,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(height: 30),
                                          Container(
                                            height: 36,
                                            width: 205,
                                            color: ColorPicker.kBlueLight2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.message,
                                                  color:
                                                      ColorPicker.kBlueLight1,
                                                  size: 10,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                CommonWidget.text(
                                                  "Send news to our editor",
                                                  style: FontTextStyle
                                                      .kBlueLight114W400SSP,
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
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 290,
                        width: Get.width,
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/Bannerimage.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonWidget.categoriesDesktop(),
                      const Divider(
                          thickness: 2, color: ColorPicker.kGreyLight10),
                      SB.SH20(),
                      Container(
                        width: Get.width,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: Get.width * 0.01,
                                right: Get.width * 0.01,
                                left: Get.width * 0.01,
                              ),
                              child: CommonWidget.text(
                                'Latest news',
                                style: FontTextStyle.kBlackPure20W400SSP
                                    .copyWith(height: 1.5),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: Get.width * 0.01,
                                      right: Get.width * 0.01,
                                      bottom: Get.width * 0.01,
                                      left: Get.width * 0.01,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image(
                                            image: AssetImage(
                                              '${data1[index]['img']}',
                                            ),
                                          ),
                                        ),
                                        SB.SW10(),
                                        Flexible(
                                          child: CommonWidget.text(
                                            '${data1[index]['txt']}',
                                            style: FontTextStyle
                                                .kBlueDark116W700SSP
                                                .copyWith(height: 1.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
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
