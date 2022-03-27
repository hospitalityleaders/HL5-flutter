import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/sizedbox.dart';

import '../../constant/fontStyle/font_style.dart';
import '../../responsive/responsive.dart';

class NewsSingleLoggedInScreen extends StatefulWidget {
  @override
  _NewsSingleLoggedInScreenState createState() =>
      _NewsSingleLoggedInScreenState();
}

class _NewsSingleLoggedInScreenState extends State<NewsSingleLoggedInScreen> {
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
                  color: Color(0xff384677),
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
                          style: FontTextStyle.kWhitePurePR,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Color(0xFF7A85A6),
                            ),
                            filled: true,
                            fillColor: Color(0xff2B375E),
                            hintText: "Search",
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF7A85A6),
                            ),
                            suffixIcon: Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 40,
                              width: Get.width * 0.045,
                              decoration: BoxDecoration(
                                color: Color(0xff384677),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'People',
                                  style: TextStyle(
                                    color: Color(0xFF7A85A6),
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
                            Text('Home',
                                style: FontTextStyle.kWhitePure16W400PR),
                            Text('Profile',
                                style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('News',
                                style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('Jobs',
                                style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('Recruitment',
                                style: FontTextStyle.kPrimaryLightBlue16W400PR),
                            Text('Help',
                                style: FontTextStyle.kPrimaryLightBlue16W400PR),
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
                          vertical:
                              BorderSide(color: Color(0xff2B375E), width: 3),
                        )),
                        child: Center(
                            child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Icon(
                              Icons.email,
                              color: Color(0xFF7A85A6),
                            ),
                            Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: Color(0xffFD3732),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: FontTextStyle.kWhitePure12W700PR,
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
                          vertical:
                              BorderSide(color: Color(0xff2B375E), width: 3),
                        )),
                        child: Center(
                            child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Icon(
                              Icons.flag,
                              color: Color(0xFF7A85A6),
                            ),
                            Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: Color(0xffFD3732),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: FontTextStyle.kWhitePure12W700PR,
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
                          vertical:
                              BorderSide(color: Color(0xff2B375E), width: 3),
                        )),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_add,
                              color: Color(0xFF7A85A6),
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
                                child: Text('352',
                                    style: FontTextStyle.kPrimaryLight10W700PR),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        width: Get.width * 0.05,
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                          vertical:
                              BorderSide(color: Color(0xff2B375E), width: 3),
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
                          decoration: BoxDecoration(
                              color: Color(0xff32A3FD),
                              borderRadius: BorderRadius.circular(2)),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/slider1.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.03,
                              width: Get.width,
                              color: Color(0xff272E41).withOpacity(0.1),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 120.0, top: 7),
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(bottom: BorderSide(width: 0.1))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
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
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/avatar.png"),
                                              fit: BoxFit.cover)),
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
                                        Text(
                                          "By: Pam Carrol",
                                          style:
                                              FontTextStyle.kGreyLight515W600PR,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.005,
                                        ),
                                        Text(
                                          "26 August 2015   •   10:40",
                                          style:
                                              FontTextStyle.kGreyLight515W600PR,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.02,
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
                            Container(
                              // height: 434,
                              // width: 712,
                              color: Color(0xffF6F7F8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 332,
                                    width: Get.width,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        PageView.builder(
                                          controller: _controller,
                                          onPageChanged: (value) {
                                            print(
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

                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/slider2.png'),
                                                fit: BoxFit.fitWidth,
                                              )),

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
                                            color: Color(0xFF272E41)
                                                .withOpacity(0.4),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  _controller.previousPage(
                                                    duration:
                                                        Duration(seconds: 1),
                                                    curve: Curves.easeIn,
                                                  );
                                                  // Use the controller to change the current page
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
                                            color: Color(0xFF272E41)
                                                .withOpacity(0.4),
                                            child: Center(
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: () {
                                                    // Use the controller to change the current page
                                                    _controller.nextPage(
                                                      duration:
                                                          Duration(seconds: 1),
                                                      curve: Curves.easeIn,
                                                    );
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 2),
                                    child: Stack(
                                      children: [
                                        Container(
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
                                                              "${data[index]['img']}"),
                                                          fit: BoxFit.cover)),
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
                                            child: Icon(
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
                            Divider(
                              color: Color(0xFF7C8990),
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet',
                              style: FontTextStyle.kBlackPure18W700PR,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                              style: FontTextStyle.kGreyLight516W400PR,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Numbered List',
                              style: FontTextStyle.kBlackPure18W700PR,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: Text('1.',
                                  textAlign: TextAlign.start,
                                  style: FontTextStyle.kGreyLight516W400PR),
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                            ),
                            ListTile(
                              leading: Text('2.',
                                  textAlign: TextAlign.start,
                                  style: FontTextStyle.kGreyLight516W400PR),
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                            ),
                            ListTile(
                              leading: Text('3.',
                                  textAlign: TextAlign.start,
                                  style: FontTextStyle.kGreyLight516W400PR),
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Bulleted List',
                              style: FontTextStyle.kBlackPure18W700PR,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: Text(
                                '\u2022',
                                textAlign: TextAlign.start,
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                '\u2022',
                                textAlign: TextAlign.start,
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                '\u2022',
                                textAlign: TextAlign.start,
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: FontTextStyle.kGreyLight516W400PR,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 30,
                                  child: Text(
                                    '"',
                                    style: FontTextStyle.kBlueLight150BOLDPR,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex',
                                    style: FontTextStyle.kBlackPure20W400PR,
                                  ),
                                ),
                                Container(
                                  width: 10,
                                  child: Text(
                                    '"',
                                    style: FontTextStyle.kBlueLight150BOLDPR,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                              style: FontTextStyle.kGreyLight516W400PR,
                            ),
                            SizedBox(
                              height: 20,
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
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                alignment: WrapAlignment.start,
                                children: List.generate(
                                  5,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      '#Hospitality',
                                      style: FontTextStyle.kGreyLight614W400PR,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Share This Article:',
                              style: FontTextStyle.kGreyLight516W400PR,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                alignment: WrapAlignment.start,
                                children: List.generate(
                                    5,
                                    (index) => Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 100,
                                          height: 36,
                                          child: Image(
                                              image: AssetImage(
                                                  '${buttonData[index]['img']}')),
                                          decoration: BoxDecoration(
                                            color: buttonData[index]['color'],
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        )),
                                // ListView.builder(
                                //   itemCount: 5,
                                //   shrinkWrap: true,
                                //   // scrollDirection: Axis.horizontal,
                                //   physics: NeverScrollableScrollPhysics(),
                                //   itemBuilder: (context, index) {
                                //     return Row(
                                //       children: [
                                //         Text('#AAA'),
                                //         SizedBox(width: 10),
                                //       ],
                                //     );
                                //   },
                                // )
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: Color(0xFFDEE1E3),
                            ),
                            Row(
                              children: [
                                Container(
                                  // width: 100,
                                  // height: 50,
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  margin: EdgeInsets.only(right: 20),
                                  child: Row(children: [
                                    Image(
                                      image:
                                          AssetImage('assets/icons/like.png'),
                                      height: 15,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Like',
                                      style: FontTextStyle.kBlueLight114W400PR,
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFCCE8FE),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Text(
                                        '12',
                                        style:
                                            FontTextStyle.kBlueLight112W700PR,
                                      ),
                                    )
                                  ]),
                                ),
                                Container(
                                  // width: 100,
                                  // height: 50,
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  margin: EdgeInsets.only(right: 20),
                                  child: Row(children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/icons/comment.png'),
                                      height: 15,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Comment',
                                      style: FontTextStyle.kBlueLight114W400PR,
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFCCE8FE),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Text(
                                        '5',
                                        style:
                                            FontTextStyle.kBlueLight112W700PR,
                                      ),
                                    )
                                  ]),
                                ),
                                Container(
                                  // width: 100,
                                  // height: 50,
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  margin: EdgeInsets.only(right: 20),
                                  child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/icons/share.png'),
                                          height: 15,
                                          width: 16,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Share',
                                          style:
                                              FontTextStyle.kBlueLight114W400PR,
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFCCE8FE),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Text(
                                            '0',
                                            style: FontTextStyle
                                                .kBlueLight112W700PR,
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Color(0xFFDEE1E3),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              // width: 100,
                              // height: 50,
                              // color: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              margin: EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Image(
                                    image:
                                        AssetImage('assets/icons/comment.png'),
                                    height: 15,
                                    width: 16,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Show previous comments',
                                    style: FontTextStyle.kBlueLight114W600PR,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            ///Comment Section

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/avatar.png'))),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'MHL',
                                                      style: TextStyle(
                                                          textBaseline:
                                                              TextBaseline
                                                                  .ideographic,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  Very interesting indeed. I’ll be watching this very closely as they expand further into Asia.",
                                                      style: TextStyle(
                                                          textBaseline:
                                                              TextBaseline
                                                                  .ideographic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'like • ',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  'Reply • ',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14),
                                                ),
                                                Icon(
                                                  Icons.thumb_up_alt,
                                                  color: Colors.blue,
                                                ),
                                                Text(
                                                  ' 12',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  ' • 5 hours ago',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/images/avatar.png'))),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.4,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Jad Limacino",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: ' MHL',
                                                      style: TextStyle(
                                                          textBaseline:
                                                              TextBaseline
                                                                  .ideographic,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "  Very interesting indeed. I’ll be watching this very closely as they expand further into Asia.",
                                                      style: TextStyle(
                                                          textBaseline:
                                                              TextBaseline
                                                                  .ideographic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'like • ',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  'Reply • ',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14),
                                                ),
                                                Icon(
                                                  Icons.thumb_up_alt,
                                                  color: Colors.blue,
                                                ),
                                                Text(
                                                  ' 12',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  ' • 5 hours ago',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
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
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/avatar.png'))),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Container(
                                      // height: 40,
                                      // width: Get.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: Color(0xFFDEE1E3))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Leave a comment'),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(thickness: 2),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: Divider(
                                  endIndent: 10,
                                  color: Color(0xFF7C8990).withOpacity(0.2),
                                )),
                                Text(
                                  'SUGGESTED NEWS',
                                  style: FontTextStyle.kGreyLight513W700PR,
                                ),
                                Flexible(
                                    child: Divider(
                                  indent: 10,
                                  color: Color(0xFF7C8990).withOpacity(0.2),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              '${suggestNewsData[index]['img']}'),
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
                                              Text(
                                                '${suggestNewsData[index]['text1']}',
                                                style: FontTextStyle
                                                    .kBlackPure18W700PR,
                                              ),
                                              Text(
                                                '${suggestNewsData[index]['text3']}',
                                                style: FontTextStyle
                                                    .kGreyLight514W600PR,
                                              ),
                                              suggestNewsData[index]['text2']
                                                      .toString()
                                                      .isEmpty
                                                  ? SizedBox()
                                                  : Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Text(
                                                        'MEMBERS ONLY',
                                                        style: FontTextStyle
                                                            .kRed10W400PR,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFECDCC),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
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
                        padding: const EdgeInsets.only(
                            left: 100, bottom: 420, right: 70),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 325,
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
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/round2.png'),
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
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
                                                  Icon(
                                                    Icons.apartment_rounded,
                                                    color: Colors.white,
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 150,
                                                    color: Colors.white,
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
                                                  'TIMELINE',
                                                  style: FontTextStyle
                                                      .kWhitePure12W700PR,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.16,
                                                  child: Text(
                                                    'Become a thought leader on hospitality',
                                                    style: FontTextStyle
                                                        .kWhitePure36W400PR,
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
                                                  Icon(
                                                    Icons.reduce_capacity_sharp,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // SizedBox(height: 30),
                                                Container(
                                                  height: 36,
                                                  width: 205,
                                                  color: Color(0xffCCE8FE),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.message,
                                                        color: Colors.blue,
                                                        size: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "Send news to our editor",
                                                        style: FontTextStyle
                                                            .kBlueLight114W400PR,
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
                                image:
                                    AssetImage('assets/images/Bannerimage.png'),
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
                                    padding: EdgeInsets.only(
                                        top: Get.width * 0.01,
                                        right: Get.width * 0.01,
                                        left: Get.width * 0.01),
                                    child: Text(
                                      'Categories',
                                      style: FontTextStyle.kBlackPure20W400PR,
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 8,
                                    itemBuilder: (context, index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Get.width * 0.01,
                                              right: Get.width * 0.01,
                                              bottom: Get.width * 0.01,
                                              left: Get.width * 0.01),
                                          child: Text(
                                            '${categories[index]['text']}',
                                            style: FontTextStyle
                                                .kBlueLight114W600PR,
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
                                          style:
                                              FontTextStyle.kBlueLight114W600PR,
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
                              width: Get.width,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: Get.width * 0.01,
                                        right: Get.width * 0.01,
                                        left: Get.width * 0.01),
                                    child: Text(
                                      'Latest news',
                                      style: FontTextStyle.kBlackPure20W400PR,
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Get.width * 0.01,
                                              right: Get.width * 0.01,
                                              bottom: Get.width * 0.01,
                                              left: Get.width * 0.01),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                child: Image(
                                                  image: AssetImage(
                                                      '${data1[index]['img']}'),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '${data1[index]['txt']}',
                                                  style: FontTextStyle
                                                      .kBlackPure16W700PR,
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

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 50, bottom: 420),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 10),
                      //     child: Column(
                      //       children: [
                      //         Container(
                      //           height: 305,
                      //           width: 364,
                      //           color: Color(0xff0D9BDC),
                      //           child: Row(
                      //             children: [
                      //               Column(
                      //                 children: [
                      //                   Expanded(
                      //                     child: ListView.builder(
                      //                       itemBuilder: (context, index) {
                      //                         return Column(
                      //                           children: [
                      //                             SvgPicture.asset("x"),
                      //                             VerticalDivider(
                      //                               width: 1,
                      //                               color: Colors.white,
                      //                             )
                      //                           ],
                      //                         );
                      //                       },
                      //                       itemCount: 3,
                      //                       shrinkWrap: true,
                      //                       scrollDirection: Axis.vertical,
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
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
            appBar: AppBar(),
            backgroundColor: ColorPicker.kBg1,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 260),
                          child: SizedBox(
                              width: Get.width,
                              child: Image.asset(
                                'assets/images/slider1.png',
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                            top: 190,
                            child: Container(
                              width: Get.width * 0.92,
                              height: Get.height * 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'RESOURCES',
                                      style: TextStyle(
                                          color: Color(0xff7C8990),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      '5 Steps for Travel Brands to Build a Brand Ambassador Program',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: Get.width * 0.18,
                                          width: Get.width * 0.18,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/images/profile.png'))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'By',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xff7C8990),
                                                    ),
                                                  ),
                                                  Text(
                                                    ': Pam Carrol',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff7C8990),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.005,
                                              ),
                                              Text(
                                                '26 August 2015 • 10:40',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xff7C8990),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Color(0xff7C8990),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 7, left: 7, bottom: 20, top: 20),
                                    child: Divider(
                                      color: Color(0xffDEE1E3),
                                      thickness: 2,
                                    ),
                                  ),
                                  Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                      style: TextStyle(
                                        color: Color(0xff7C8990),
                                        fontSize: 17,
                                      )),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                                      style: TextStyle(
                                          color: Color(0xff7C8990),
                                          fontSize: 17)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                      'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                                      style: TextStyle(
                                          color: Color(0xff7C8990),
                                          fontSize: 17)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 6, color: Color(0xffF6F7F8)),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: Color(0xffBDC4C7),
                                              offset: Offset(0, 4))
                                        ]),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            'assets/images/slider2.png'),
                                        SizedBox(
                                          height: Get.height * 0.003,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: Get.height * 0.1,
                                              width: Get.width * 0.23,
                                              child: Image.asset(
                                                'assets/images/l1.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.008,
                                            ),
                                            Container(
                                              height: Get.height * 0.1,
                                              width: Get.width * 0.23,
                                              child: Image.asset(
                                                'assets/images/l2.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.008,
                                            ),
                                            Container(
                                              height: Get.height * 0.1,
                                              width: Get.width * 0.23,
                                              child: Image.asset(
                                                'assets/images/l3.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.008,
                                            ),
                                            Container(
                                                height: Get.height * 0.1,
                                                width: Get.width * 0.14,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/l4.png',
                                                        ),
                                                        fit: BoxFit.cover)),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 28),
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                        size: 12,
                                                      )),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text('Lorem ipsum dolor sit amet',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                      style: TextStyle(
                                          color: Color(0xff7C8990),
                                          fontSize: 17)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                                      style: TextStyle(
                                          color: Color(0xff7C8990),
                                          fontSize: 17)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text('Numbered List',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 60),
                                        child: Text('1.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      Container(
                                        width: Get.height * 0.37,
                                        child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 60),
                                        child: Text('2.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      Container(
                                        width: Get.height * 0.37,
                                        child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 60),
                                        child: Text('3.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      Container(
                                        width: Get.height * 0.37,
                                        child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Text('Bulleted List',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 60),
                                        child: Text('•',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 30)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      Container(
                                        width: Get.height * 0.37,
                                        child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 60),
                                        child: Text('•',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 30)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      Container(
                                        width: Get.height * 0.37,
                                        child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 60),
                                        child: Text('•',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 30)),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      Container(
                                        width: Get.height * 0.37,
                                        child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut	labore et dolore magna aliqua.',
                                            style: TextStyle(
                                                color: Color(0xff7C8990),
                                                fontSize: 17)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 150),
                                        child: Image.asset(
                                            'assets/icons/invot1.png'),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            width: Get.height * 0.36,
                                            child: Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20)),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(top: 150),
                                        child: Image.asset(
                                            'assets/icons/invot.png'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                      style: TextStyle(
                                          color: Color(0xff7C8990),
                                          fontSize: 18)),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Text('TAGS:',
                                      style: TextStyle(
                                          color: Color(0xffB5BDC2),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Container(
                                      height: Get.height * 0.13,
                                      width: Get.width * 0.9,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              tag(
                                                  title: '#Hospital',
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.2),
                                              tag(
                                                  title: '#Brand',
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.16),
                                              tag(
                                                  title: '#Ambassador',
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.25),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              tag(
                                                  title: '#Hotal',
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.16),
                                              tag(
                                                  title: '#Icon',
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.15),
                                              tag(
                                                  title: '#Travel',
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.15),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Text('SHARE THIS ARTICLE:',
                                      style: TextStyle(
                                          color: Color(0xffB5BDC2),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      box(
                                          color: Color(0xff04595B),
                                          image: 'assets/icons/x.png'),
                                      SizedBox(
                                        width: Get.width * 0.01,
                                      ),
                                      box(
                                          color: Color(0xff1C86BC),
                                          image: 'assets//icons/linkdin.png'),
                                      SizedBox(
                                        width: Get.width * 0.01,
                                      ),
                                      box(
                                          color: Color(0xffD63B30),
                                          image: 'assets/icons/gp.png'),
                                      SizedBox(
                                        width: Get.width * 0.01,
                                      ),
                                      box(
                                          color: Color(0xff00ABF0),
                                          image: 'assets/icons/twitter.png'),
                                      SizedBox(
                                        width: Get.width * 0.01,
                                      ),
                                      box(
                                          color: Color(0xff344F8D),
                                          image: 'assets/icons/fb.png'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.015,
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Color(0xffDEE1E3),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      likeCommentShare.length,
                                      (index) => Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                likeCommentShare[index]['img']),
                                            height: 15,
                                            width: 16,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            likeCommentShare[index]['title'],
                                            style: FontTextStyle
                                                .kBlueLight114W400PR,
                                          ),
                                          SizedBox(width: 5),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFCCE8FE),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Text(
                                                likeCommentShare[index]
                                                    ['total'],
                                                style: FontTextStyle
                                                    .kBlueLight112W700PR,
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
                          Divider(
                            thickness: 2,
                            color: Color(0xffDEE1E3),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/icons/comment.png'),
                                  height: 15,
                                  width: 16,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 5),
                                Text(
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
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/avatar.png'))),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.4,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: "Jad Limacino",
                                                      style: FontTextStyle
                                                          .kBlackPure16W600PR,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: 'MHL',
                                                          style: TextStyle(
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "  Very interesting indeed. I’ll be watching this very closely as they expand further into Asia.",
                                                          style: TextStyle(
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'like • ',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      'Reply • ',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 14),
                                                    ),
                                                    Icon(
                                                      Icons.thumb_up_alt,
                                                      color: Colors.blue,
                                                    ),
                                                    Text(
                                                      ' 12',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      ' • 5 hours ago',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/avatar.png'))),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.01,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.4,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: "Jad Limacino",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: ' MHL',
                                                          style: TextStyle(
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "  Very interesting indeed. I’ll be watching this very closely as they expand further into Asia.",
                                                          style: TextStyle(
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'like • ',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      'Reply • ',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 14),
                                                    ),
                                                    Icon(
                                                      Icons.thumb_up_alt,
                                                      color: Colors.blue,
                                                    ),
                                                    Text(
                                                      ' 12',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      ' • 5 hours ago',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
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
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/avatar.png'))),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Container(
                                          // height: 40,
                                          // width: Get.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color: Color(0xFFDEE1E3))),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: InputBorder.none,
                                                hintText: 'Leave a comment'),
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              thickness: 2,
                              color: Color(0xffDEE1E3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Divider(
                          endIndent: 10,
                          color: Color(0xFF7C8990).withOpacity(0.2),
                        )),
                        Text(
                          'SUGGESTED NEWS',
                          style: FontTextStyle.kGreyLight513W700PR,
                        ),
                        Flexible(
                            child: Divider(
                          indent: 10,
                          color: Color(0xFF7C8990).withOpacity(0.2),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 300,
                      // width: 400,
                      child: ListView.builder(
                        itemCount: suggestNewsData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            height: 300,
                            width: 400,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage(
                                      '${suggestNewsData[index]['img']}'),
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
                                      Text(
                                        '${suggestNewsData[index]['text1']}',
                                        style: FontTextStyle.kBlackPure18W700PR,
                                      ),
                                      Text(
                                        '${suggestNewsData[index]['text3']}',
                                        style:
                                            FontTextStyle.kGreyLight514W600PR,
                                      ),
                                      suggestNewsData[index]['text2']
                                              .toString()
                                              .isEmpty
                                          ? SizedBox()
                                          : Container(
                                              padding: EdgeInsets.all(5),
                                              child: Text(
                                                'MEMBERS ONLY',
                                                style:
                                                    FontTextStyle.kRed10W400PR,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFECDCC),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                    ],
                                  )),
                                ),
                                Divider(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius: 8,
                                // foregroundColor: Colors.red,
                                backgroundColor: index == 0
                                    ? Color(0xFF33A3FE)
                                    : Color(0xFF33A3FE).withOpacity(0.19),
                              ),
                            );
                          },
                        )),
                    SB.SH20(),
                    Container(
                      height: 310,
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
                              child: Image(
                                  image: AssetImage('assets/images/round2.png'),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
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
                                          Icon(
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
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(height: 30),
                                        Text(
                                          'GOT NEWS ?',
                                          style:
                                              FontTextStyle.kWhitePure12W700PR,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.34,
                                          child: Text(
                                            'Become a thought leader on hospitality',
                                            style: FontTextStyle
                                                .kWhitePure24W400PR,
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
                                          Icon(
                                            Icons.reduce_capacity_sharp,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
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
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(height: 30),
                                        Container(
                                          height: 36,
                                          width: 205,
                                          color: Color(0xffCCE8FE),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.message,
                                                color: Colors.blue,
                                                size: 10,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Send news to our editor",
                                                style: FontTextStyle
                                                    .kBlueLight114W400PR,
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
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: ColorPicker.kBorder1),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/menu.png'),
                              SizedBox(height: 3),
                              Text(
                                'menu',
                                style: TextStyle(
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
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Latest news',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
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
                                Divider(),
                                Container(
                                  padding: EdgeInsets.all(Get.width * 0.01),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Image(
                                            image: AssetImage(
                                                '${data1[index]['img']}'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text(
                                            '${data1[index]['txt']}',
                                            style: FontTextStyle
                                                .kBlackPure16W700PR,
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
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/Bannerimage.png')))),
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
          decoration: BoxDecoration(
              color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(3)),
        ));
  }
}
