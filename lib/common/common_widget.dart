import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import '../constant/colorPicker/color_picker.dart';
import '../constant/fontStyle/font_style.dart';
import '../constant/sizedbox.dart';
import '../data/data.dart';

class CommonWidget {
  static PreferredSize descktopAppBar() {
    return PreferredSize(
        child: Container(
          height: 100,
          color: ColorPicker.kPrimaryLight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  height: 46,
                ),
                Row(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                      child: Text(
                        Data.menuItem[index],
                        style: FontTextStyle.kWhite16W600PR,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 46,
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                      decoration: BoxDecoration(
                        color: ColorPicker.kBlack,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/lock.png',
                              height: 24, width: 25),
                          SizedBox(
                            width: Get.width * 0.012,
                          ),
                          Text(
                            'Log In',
                            style: FontTextStyle.kWhite16W600PR,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Container(
                      height: 46,
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                      decoration: BoxDecoration(
                        color: ColorPicker.kBlueLight,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up Free',
                          style: FontTextStyle.kWhite16W600PR,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(100));
  }

  static PreferredSize tabletAppBar() {
    return PreferredSize(
      child: Container(
        height: 71,
        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
        color: ColorPicker.kPrimaryLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/mobileLogo.png',
              height: Get.height * 0.05,
              width: Get.width * 0.19,
            ),
            Icon(
              Icons.menu,
              color: Colors.white,
              size: Get.width * 0.05,
            )
          ],
        ),
      ),
      preferredSize: const Size.fromHeight(100),
    );
  }

  static Widget text(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return TextRenderer(
        child: Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    ));
  }

  static Widget seoRenderAutoText(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
    double? minFontSize,
    int? maxLines,
  }) {
    return TextRenderer(
      child: AutoSizeText(
        text,
        style: style,
        minFontSize: minFontSize!,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget categoriesDesktop() {
    return Container(
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
            child: CommonWidget.text(
              'Categories',
              style: FontTextStyle.kBlueDark120W400SSP.copyWith(height: 1.5),
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
                  padding: EdgeInsets.only(
                      top: Get.width * 0.01,
                      right: Get.width * 0.01,
                      bottom: Get.width * 0.01,
                      left: Get.width * 0.01),
                  child: CommonWidget.text(
                    '${Data.categories[index]['text']}',
                    style: FontTextStyle.kBlueLight114W600SSP
                        .copyWith(height: 1.5),
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: EdgeInsets.all(Get.width * 0.01),
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: ColorPicker.kBlueLight1,
                ),
                SB.SW5(),
                CommonWidget.text(
                  'Show more',
                  style: FontTextStyle.kBlueLight114W600SSP,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget blueDarkSignUp() {
    return Container(
      height: 800, // height: Get.height,
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
                  image: AssetImage('assets/images/round.png'),
                  fit: BoxFit.fitWidth),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: Get.width * 0.025),
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
                    SB.SW20(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 30),
                        CommonWidget.text(
                          'THIS ARTICLE IS FOR MEMBERS ONLY. SIGN UP TO JOIN',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SB.SH20(),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: CommonWidget.text(
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
                    SB.SW20(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidget.text(
                          'Latest news',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: CommonWidget.text(
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
                    SB.SW20(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidget.text(
                          'Exclusive content',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: CommonWidget.text(
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
                    SB.SW20(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidget.text(
                          'News that matter',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: CommonWidget.text(
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
                          color: ColorPicker.kPrimaryLight3,
                        ),
                      ],
                    ),
                    SB.SW20(),
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
                              CommonWidget.text(
                                'Sign up now. It’s free',
                                style: TextStyle(
                                  color: Color(0xFF272E41),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )),
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
                          Icons.download_rounded,
                          color: ColorPicker.kPrimaryLight3,
                        ),
                      ],
                    ),
                    SB.SW20(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width * 0.15,
                          child: CommonWidget.text(
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
                SB.SH10(),
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
    );
  }

  static Widget blueLightSignUp() {
    return Container(
      height: 365,
      width: Get.width,
      color: ColorPicker.kBlueLight3,
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
                        CommonWidget.text(
                          'ALL ACCESS',
                          style: FontTextStyle.kWhite12W700SSP,
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: Get.width * 0.18,
                          child: CommonWidget.text(
                            'Get full access to the hospitality industry news',
                            style: FontTextStyle.kWhite36W400PR
                                .copyWith(fontSize: Get.width * 0.02),
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
                                  CommonWidget.text(
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
                          SB.SH10(),
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
                        CommonWidget.text(
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
    );
  }
}
