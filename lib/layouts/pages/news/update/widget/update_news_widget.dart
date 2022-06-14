import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../common/common_widget.dart';
import '../../../../../constant/colorPicker/color_picker.dart';
import '../../../../../constant/fontStyle/font_style.dart';
import '../../../../../data/data.dart';



class HomeWidget {
  Container headlineBlock() {
    return Container(
        height: 744,
        margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
        padding: EdgeInsets.symmetric(vertical: 34),
        decoration: BoxDecoration(
          color: ColorPicker.kYellowLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------1
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonWidget.text(
                          'Headline',
                          style: FontTextStyle.kBlueDark32W600PR,
                        )),
                    Divider(
                      color: ColorPicker.kBorder,
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    CommonWidget.text(
                      'Hamburg, DE',
                      style: FontTextStyle.kPrimaryLight32W600PR,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CommonWidget.text(
                      '3 February 2022 15:13',
                      style: FontTextStyle.kPrimaryLight16W600PR,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/cloud.png', height: 30),
                        CommonWidget.text(
                          '7°C',
                          style: FontTextStyle.kPrimaryLight40W600PR,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CommonWidget.text(
                      'Bedecket',
                      style: FontTextStyle.kPrimaryLight22W600PR,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            Data.bedecketItem.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.008, vertical: 12),
                              child: CommonWidget.text(
                                '${Data.bedecketItem[index]}:',
                                style: FontTextStyle.kPrimaryLight18W600PR,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            Data.bedecketValue.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.01, vertical: 12),
                              child: CommonWidget.text(
                                '${Data.bedecketValue[index]}',
                                style: FontTextStyle.kPrimaryLight18W600PR,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 47,
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: ColorPicker.kBlueLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: CommonWidget.text(
                          'Wheather from OpenWeatherMap',
                          style: FontTextStyle.kWhite16W600PR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(
              color: ColorPicker.kBorder,
              width: 28,
            ),

            ///------2
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.216,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "'We must stay at update':",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "Hong Kong expected to confirm 614 coronavirus cases",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.",
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 8,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 413,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/public.png')),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: ColorPicker.kBorder,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      rowText()
                    ],
                  ),
                )),
            SizedBox(width: Get.width * 0.015),

            ///------3
            Expanded(
              flex: 2,
              child: Container(
                height: Get.height * 0.7,
                decoration: BoxDecoration(
                  color: ColorPicker.kPrimaryLight,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(right: Get.width * 0.015),
                padding: EdgeInsets.symmetric(
                    vertical: Get.width * 0.02, horizontal: Get.width * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget.text(
                      '25%',
                      style: FontTextStyle.kWhite83W600PR
                          .copyWith(fontSize: Get.width * 0.045),
                    ),
                    LinearPercentIndicator(
                      lineHeight: 8.0,
                      width: Get.width * 0.12,
                      alignment: MainAxisAlignment.center,
                      percent: 0.25,
                      backgroundColor: Colors.black,
                      progressColor: ColorPicker.kRed,
                      barRadius: Radius.circular(20),
                    ),
                    CommonWidget.text(
                      "Your Profile is only 25% complete. Improve it now. Here's how",
                      style: FontTextStyle.kWhite18W600PR,
                      textAlign: TextAlign.center,
                    ),
                    ListView.builder(
                      itemCount: Data.specification.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                color: ColorPicker.kBlueLight,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: CommonWidget.text(
                                  "Add your work experience",
                                  style: FontTextStyle.kBlueLight20W600PR
                                      .copyWith(fontSize: Get.height * 0.018),
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.2),
                                height: 25,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.006),
                                child: Center(
                                    child: CommonWidget.text(
                                  '+20%',
                                  style: TextStyle(
                                    color: ColorPicker.kBlueLight,
                                  ),
                                )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.width * 0.005,
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: Get.width * 0.002,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          color: ColorPicker.kBlueLight,
                          borderRadius:
                              BorderRadius.circular(Get.height * 0.01)),
                      child: Center(
                        child: CommonWidget.text(
                          "Edit my profile",
                          style: TextStyle(
                              color: Colors.white, fontSize: Get.height * 0.02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Container videoBlock() {
    return Container(
      margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
      height: 743,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorPicker.kBorder, width: 2)),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: Get.width,
                // color: Colors.red,
                margin: EdgeInsets.all(Get.width * 0.01),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidget.text(
                              'Video',
                              style: FontTextStyle.kPrimaryLight20W600PR,
                            ),
                            Divider(
                              color: ColorPicker.kBorder,
                              thickness: 1,
                            ),
                            Expanded(
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: Get.width * 0.01),
                                  alignment: Alignment.center,
                                  // width: Get.width,
                                  decoration: BoxDecoration(
                                      color: ColorPicker.kBlueLight,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: CommonWidget.text(
                                    'Widget Area',
                                    style: FontTextStyle.kBlueDark32W600PR,
                                  )),
                            ),
                          ]),
                    ),
                    SizedBox(height: 50),
                    Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidget.text(
                              'Widget block type X',
                              style: FontTextStyle.kPrimaryLight20W600PR,
                            ),
                            Divider(
                              color: ColorPicker.kBorder,
                              thickness: 1,
                            ),
                            Expanded(
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: Get.width * 0.01),
                                  alignment: Alignment.center,
                                  // width: Get.width,
                                  decoration: BoxDecoration(
                                      color: ColorPicker.kBlueLight,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: CommonWidget.text(
                                    'Widget Area',
                                    style: FontTextStyle.kBlueDark32W600PR,
                                  )),
                            ),
                          ]),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
              // color: Colors.blue,
              margin: EdgeInsets.all(Get.width * 0.01),
              child: Column(children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      //overflow: Overflow.visible,
                      children: [
                        Image(
                          image: AssetImage('assets/images/couple_bg.png'),
                          height: Get.height * 0.55,
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: Get.height * 0.15,
                            width: Get.width,
                            color: Colors.black54,
                            child: Row(children: [
                              Container(
                                margin: EdgeInsets.only(left: Get.width * 0.01),
                                padding: EdgeInsets.all(Get.height * 0.03),
                                height: Get.height * 0.1,
                                width: Get.height * 0.1,
                                decoration: BoxDecoration(
                                    color: ColorPicker.kBlueLight,
                                    borderRadius: BorderRadius.circular(4)),
                                child: SvgPicture.asset(
                                  'assets/icons/play_arrow.svg',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: Get.width * 0.01),
                              CommonWidget.text(
                                'Couple fight boy’s brain cancer with\nnatural remedies',
                                style: FontTextStyle.kWhite20W600PR,
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.width * 0.01),
                Divider(color: ColorPicker.kBorder, thickness: 2),
                SizedBox(height: Get.width * 0.01),
                rowText(),
              ]),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                width: Get.width,
                // color: Colors.red,
                margin: EdgeInsets.all(Get.width * 0.01),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  // width: Get.width,
                                  decoration: BoxDecoration(
                                      color: ColorPicker.kBlueLight,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: CommonWidget.text(
                                    'Widget Area',
                                    style: FontTextStyle.kBlueLight33W600PR,
                                  )),
                            ),
                          ]),
                    ),
                    SizedBox(height: 50),
                    Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  // width: Get.width,
                                  decoration: BoxDecoration(
                                      color: ColorPicker.kBlueLight,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: CommonWidget.text(
                                    'Widget Area',
                                    style: FontTextStyle.kBlueLight33W600PR,
                                  )),
                            ),
                          ]),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Container categoryA() {
    return Container(
        height: 744,
        margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
        padding: EdgeInsets.only(top: 34, bottom: 34, right: 24),
        decoration: BoxDecoration(
          color: ColorPicker.kYellowLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonWidget.text(
                          'Categort Type A',
                          style: FontTextStyle.kBlueDark32W600PR,
                        )),
                    Divider(
                      color: ColorPicker.kBorder,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    widgetArea(),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.width * 0.14,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/alone_girl.png')),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.01,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          "‘I’ve had letters from klansmen’: ",
                                      style: FontTextStyle.kRed28W600PR
                                          .copyWith(
                                              fontSize: Get.width * 0.015),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                'Jennifer Beals on Flashdance',
                                            style: FontTextStyle
                                                .kPrimaryLight28W600PR
                                                .copyWith(
                                                    fontSize:
                                                        Get.width * 0.015)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.15,
                                    child: CommonWidget.text(
                                      'How buddhism has changed the west for better',
                                      style: FontTextStyle.kPrimaryLight28W600PR
                                          .copyWith(
                                              fontSize: Get.width * 0.015),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.02,
                                  ),
                                  CommonWidget.text(
                                    'Rebecca Sonlit',
                                    style: FontTextStyle.kRed28W600PR
                                        .copyWith(fontSize: Get.width * 0.015),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        radius: Get.width * 0.04,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            'assets/images/profile2.png'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: ColorPicker.kBorder,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      rowText(),
                    ],
                  ),
                )),
            SizedBox(width: Get.width * 0.015),
            weatherBlock(),
          ],
        ));
  }

  Container categoryB() {
    return Container(
        height: 744,
        margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
        padding: EdgeInsets.only(top: 34, bottom: 34, right: 24),
        decoration: BoxDecoration(
          color: ColorPicker.kYellowLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------1
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonWidget.text(
                          'Categort Type B',
                          style: FontTextStyle.kBlueDark32W600PR,
                        )),
                    Divider(
                      color: ColorPicker.kBorder,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widgetArea(),
                  ],
                ),
              ),
            ),

            ///------2
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.216,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "'We must stay at update':",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "Hong Kong expected to confirm 614 coronavirus cases",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.",
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 8,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 413,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/public.png')),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: ColorPicker.kBorder,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      rowText(),
                    ],
                  ),
                )),
            SizedBox(
              width: Get.width * 0.015,
            ),

            ///------3
            weatherBlock(),
          ],
        ));
  }

  Container categoryC() {
    return Container(
        height: 744,
        margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
        padding: EdgeInsets.symmetric(vertical: 34),
        decoration: BoxDecoration(
          color: ColorPicker.kYellowLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------1
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonWidget.text(
                          'Categort Type C',
                          style: FontTextStyle.kBlueDark32W600PR,
                        )),
                    Divider(
                      color: ColorPicker.kBorder,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    weatherBlock(),
                  ],
                ),
              ),
            ),

            ///------2
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/news.png'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.001,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/twitter.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: ColorPicker.kBorder,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonWidget.text(
                                              "Winter Olympics/",
                                              textAlign: TextAlign.justify,
                                              style: FontTextStyle.kRed8W600PR,
                                            ),
                                            CommonWidget.text(
                                              "snowboarder Su Yiming claims silver in slopestyle final",
                                              textAlign: TextAlign.start,
                                              style: FontTextStyle
                                                  .kPrimaryLight18W600PR
                                                  .copyWith(
                                                      height:
                                                          Get.width * 0.0008),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: Get.width * 0.03,
                                        width: Get.width * 0.03,
                                        decoration: BoxDecoration(
                                            color: ColorPicker.kRed,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/profile.png')),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(width: Get.width * 0.015),

            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: Get.width * 0.015),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorPicker.kBlueLight,
                ),
                child: Center(
                    child: CommonWidget.text(
                  'Widget Area',
                  textAlign: TextAlign.center,
                  style: FontTextStyle.kWhite66W600PR,
                )),
              ),
            ),
          ],
        ));
  }

  Container categoryD() {
    return Container(
        height: 744,
        margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
        padding: EdgeInsets.only(top: 34, bottom: 34, right: 24),
        decoration: BoxDecoration(
          color: ColorPicker.kYellowLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------1
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonWidget.text(
                          'Category Type D',
                          style: FontTextStyle.kBlueDark32W600PR,
                        )),
                    Divider(
                      color: ColorPicker.kBorder,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    widgetArea(),
                  ],
                ),
              ),
            ),

            ///------2
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/news.png'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.001,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/twitter.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: ColorPicker.kBorder,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonWidget.text(
                                              "Winter Olympics/",
                                              textAlign: TextAlign.justify,
                                              style: FontTextStyle.kRed8W600PR,
                                            ),
                                            CommonWidget.text(
                                              "snowboarder Su Yiming claims silver in slopestyle final",
                                              textAlign: TextAlign.start,
                                              style: FontTextStyle
                                                  .kPrimaryLight18W600PR
                                                  .copyWith(
                                                      height:
                                                          Get.width * 0.0008),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: Get.width * 0.03,
                                        width: Get.width * 0.03,
                                        decoration: BoxDecoration(
                                            color: ColorPicker.kRed,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/profile.png')),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              width: Get.width * 0.015,
            ),

            ///------3
            weatherBlock(),
          ],
        ));
  }

  Container categoryE() {
    return Container(
        height: 843,
        margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
        padding: EdgeInsets.only(top: 34, bottom: 34, right: 24),
        decoration: BoxDecoration(
          color: ColorPicker.kYellowLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------1
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonWidget.text(
                          'Category Type E',
                          style: FontTextStyle.kBlueDark32W600PR,
                        )),
                    Divider(
                      color: ColorPicker.kBorder,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    weatherBlock(),
                  ],
                ),
              ),
            ),

            ///------2
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/E1.png'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.001,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/E2.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: ColorPicker.kBorder,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              width: Get.width * 0.015,
            ),

            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: Get.width * 0.015),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorPicker.kBlueLight,
                ),
                child: Center(
                    child: CommonWidget.text(
                  'Widget Area',
                  textAlign: TextAlign.center,
                  style: FontTextStyle.kWhite66W600PR,
                )),
              ),
            ),
          ],
        ));
  }

  Container category() {
    return Container(
        height: 744,
        margin: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.07),
        padding: EdgeInsets.only(top: 34, bottom: 34, right: 24),
        decoration: BoxDecoration(
          color: ColorPicker.kYellowLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------1
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: CommonWidget.text(
                          'Category',
                          style: FontTextStyle.kBlueDark32W600PR,
                        )),
                    Divider(
                      color: ColorPicker.kBorder,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    widgetArea(),
                  ],
                ),
              ),
            ),

            ///------2
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.22,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.width * 0.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        image:
                                            AssetImage('assets/images/E2.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.01,
                                  ),
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(
                                            fontSize: Get.width * 0.008,
                                            height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      fontSize: Get.width * 0.008,
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(color: ColorPicker.kBorder),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.width * 0.12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        image:
                                            AssetImage('assets/images/E1.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.01,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Winter Olympics/",
                                      style: FontTextStyle.kRed8W600PR,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                ' snowboarder Su Yiming claims silver in slopestyle final',
                                            style: FontTextStyle
                                                .kPrimaryLight18W600PR),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.01,
                                  ),
                                  CommonWidget.text(
                                    'The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(fontSize: Get.width * 0.01),
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
                      Divider(
                        color: ColorPicker.kBorder,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                              VerticalDivider(
                                color: ColorPicker.kBorder,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.text(
                                    "Winter Olympics/",
                                    textAlign: TextAlign.justify,
                                    style: FontTextStyle.kRed8W600PR,
                                  ),
                                  CommonWidget.text(
                                    "snowboarder Su Yiming claims silver in slopestyle final",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kPrimaryLight18W600PR
                                        .copyWith(height: Get.width * 0.0008),
                                  ),
                                  SizedBox(height: Get.width * 0.005),
                                  CommonWidget.text(
                                    "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                                    textAlign: TextAlign.start,
                                    style: FontTextStyle.kGreyLight16W600PR
                                        .copyWith(
                                      height: Get.width * 0.0008,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              width: Get.width * 0.015,
            ),

            ///------3
            weatherBlock(),
          ],
        ));
  }

  Padding latestNewsBlock() {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.07),
      child: Container(
        height: 168,
        child: ListView.builder(
          itemCount: Data.imageList.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            height: 168,
            margin: EdgeInsets.only(right: Get.width * 0.01),
            width: 494,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Data.imageList[index])),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 25, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidget.text(
                          'Sarah Lee MHL',
                          style: FontTextStyle.kBlueDark22W600PR,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonWidget.text(
                          'Nasa has expressed concern about SpaceX’s proposed second-generation',
                          style: FontTextStyle.kGreyLight16W600PR,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding peopleBlock() {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.07),
      child: Container(
        height: 168,
        child: ListView.builder(
          itemCount: Data.imageList.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            height: 168,
            margin: EdgeInsets.only(right: Get.width * 0.01),
            width: 494,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Data.imageList[index])),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 25, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonWidget.text(
                          'Sarah Lee MHL',
                          style: FontTextStyle.kBlueDark22W600PR,
                        ),
                        CommonWidget.text(
                          'General Manager\nOne & Only Hotel',
                          style: FontTextStyle.kGreyLight16W600PR,
                        ),
                        Container(
                          height: 36,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: ColorPicker.kBlueLight),
                          child: Center(
                              child: CommonWidget.text(
                            'Connect',
                            style: FontTextStyle.kWhite16W600PR,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row widgetIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: index == 0
                    ? ColorPicker.kBlueLight
                    : ColorPicker.kBlueLight.withOpacity(0.3),
                radius: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding jobsBlock() {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.07),
      child: Container(
        height: 339,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            height: 339,
            margin: EdgeInsets.only(right: Get.width * 0.01),
            width: 303,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: ColorPicker.kBorder1),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 153,
                    margin: EdgeInsets.only(top: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: ColorPicker.kGreen),
                    child: Center(
                        child: CommonWidget.text(
                      'Premium Listing',
                      style: FontTextStyle.kWhite116W600PR,
                    )),
                  ),
                ),
                index.isOdd
                    ? SizedBox(
                        height: 32,
                      )
                    : SizedBox(),
                index.isOdd
                    ? Image.asset('assets/images/fairmont_logo.png')
                    : Image.asset('assets/images/hilton_logo.png'),
                SizedBox(
                  height: 35,
                ),
                Divider(
                  color: ColorPicker.kBorder,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CommonWidget.text(
                      'Cluster Sales Manager - Leisure & MICE',
                      style: FontTextStyle.kBlueDark22W600PR),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CommonWidget.text('Hilton, Capetown',
                        style: FontTextStyle.kGreyDark16W600PR),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding blockTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.07),
      child: CommonWidget.text(
        title,
        style: FontTextStyle.kBlueDark28W600PR,
      ),
    );
  }

  Expanded weatherBlock() {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPicker.kPrimaryLight,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
            vertical: Get.width * 0.02, horizontal: Get.width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonWidget.text(
              'Hamburg, DE',
              style: FontTextStyle.kWhite33W600PR,
            ),
            SizedBox(
              height: 15,
            ),
            CommonWidget.text(
              '3 February 2022 15:13',
              style: FontTextStyle.kWhite16W600PR,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/cloudwhite.svg', height: 30),
                CommonWidget.text(
                  '7°C',
                  style: FontTextStyle.kWhite40W600PR,
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            CommonWidget.text(
              'Bedecket',
              style: FontTextStyle.kWhite22W600PR,
            ),
            SizedBox(
              height: Get.width * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    Data.bedecketItem.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.008, vertical: 12),
                      child: CommonWidget.text(
                        '${Data.bedecketItem[index]}:',
                        style: FontTextStyle.kWhite18W600PR,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    Data.bedecketValue.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.01, vertical: 12),
                      child: CommonWidget.text(
                        '${Data.bedecketValue[index]}',
                        style: FontTextStyle.kWhite18W600PR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 47,
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.01,
              ),
              decoration: BoxDecoration(
                color: ColorPicker.kBlueLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CommonWidget.text(
                  'Wheather from OpenWeatherMap',
                  style: FontTextStyle.kWhite16W600PR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded rowText() {
    return Expanded(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.text(
                  "Winter Olympics/",
                  textAlign: TextAlign.justify,
                  style: FontTextStyle.kRed8W600PR,
                ),
                CommonWidget.text(
                  "snowboarder Su Yiming claims silver in slopestyle final",
                  textAlign: TextAlign.start,
                  style: FontTextStyle.kPrimaryLight18W600PR
                      .copyWith(height: Get.width * 0.0008),
                ),
                SizedBox(height: 20),
                CommonWidget.text(
                  "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                  textAlign: TextAlign.start,
                  style: FontTextStyle.kGreyLight16W600PR.copyWith(
                    height: Get.width * 0.0008,
                  ),
                ),
              ],
            )),
            VerticalDivider(
              color: ColorPicker.kBorder,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.text(
                  "Winter Olympics/",
                  textAlign: TextAlign.justify,
                  style: FontTextStyle.kRed8W600PR,
                ),
                CommonWidget.text(
                  "snowboarder Su Yiming claims silver in slopestyle final",
                  textAlign: TextAlign.start,
                  style: FontTextStyle.kPrimaryLight18W600PR
                      .copyWith(height: Get.width * 0.0008),
                ),
                SizedBox(height: 20),
                CommonWidget.text(
                  "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                  textAlign: TextAlign.start,
                  style: FontTextStyle.kGreyLight16W600PR.copyWith(
                    height: Get.width * 0.0008,
                  ),
                ),
              ],
            )),
            VerticalDivider(
              color: ColorPicker.kBorder,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.text(
                  "Winter Olympics/",
                  textAlign: TextAlign.justify,
                  style: FontTextStyle.kRed8W600PR,
                ),
                CommonWidget.text(
                  "snowboarder Su Yiming claims silver in slopestyle final",
                  textAlign: TextAlign.start,
                  style: FontTextStyle.kPrimaryLight18W600PR
                      .copyWith(height: Get.width * 0.0008),
                ),
                SizedBox(height: 20),
                CommonWidget.text(
                  "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                  textAlign: TextAlign.start,
                  style: FontTextStyle.kGreyLight16W600PR.copyWith(
                    height: Get.width * 0.0008,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Expanded widgetArea() {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorPicker.kBlueLight,
        ),
        child: Center(
            child: CommonWidget.text(
          'Widget Area',
          textAlign: TextAlign.center,
          style: FontTextStyle.kWhite66W600PR,
        )),
      ),
    );
  }
}
