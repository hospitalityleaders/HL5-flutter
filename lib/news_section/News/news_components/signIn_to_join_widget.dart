import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/news_section/colorPicker/color_picker.dart';
import 'package:holedo/news_section/common_widget.dart';
import 'package:holedo/news_section/fontStyle/font_style.dart';

class SignInToJoinWidget extends StatelessWidget {
  const SignInToJoinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      // height: Get.height,
      width: 350,
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
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicWidth(
                    child: Column(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 2,
                          height: 40,
                          color: ColorPicker.kPrimaryLight3,
                        ),
                        Icon(
                          Icons.apartment_rounded,
                          color: ColorPicker.kPrimaryLight3,
                        ),
                        Container(
                          width: 2,
                          height: 70,
                          color: ColorPicker.kPrimaryLight3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SB.SH40(),
                      CommonWidget.text(
                        'SIGN UP TO JOIN',
                        style: FontTextStyle.kWhite12W700SSP,
                      ),
                      SizedBox(
                        width: 270,
                        child: CommonWidget.text(
                          'Get priority news access',
                          style: FontTextStyle.kWhite36W400SSP
                              .copyWith(fontSize: 28),
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
                        height: 40,
                        color: ColorPicker.kPrimaryLight3,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidget.text(
                        'All the latest news',
                        style: FontTextStyle.kWhite16W700SSP,
                      ),
                      SizedBox(
                        width: 270,
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
                        Icons.verified_rounded,
                        color: ColorPicker.kPrimaryLight3,
                      ),
                      Container(
                        width: 2,
                        height: 60,
                        color: ColorPicker.kPrimaryLight3,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidget.text(
                        'Credible sources',
                        style: FontTextStyle.kWhite16W700SSP,
                      ),
                      SizedBox(
                        width: 270,
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
                        height: 150,
                        color: ColorPicker.kPrimaryLight3,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidget.text(
                        'Wide scope of research',
                        style: FontTextStyle.kWhite16W700SSP,
                      ),
                      SizedBox(
                        width: 270,
                        child: CommonWidget.text(
                          'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
                          style: FontTextStyle.kWhite14W400SSP,
                        ),
                      ),
                      SB.SH15(),
                      Container(
                        width: 270,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_add,
                                  size: 15, color: ColorPicker.kBlueDark1),
                              SB.SW5(),
                              CommonWidget.text(
                                'Sign up now. It’s free',
                                style: FontTextStyle.kBlueDark114W600SSP,
                              ),
                            ],
                          ),
                        ),
                      )
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
                        Icons.download_rounded,
                        color: ColorPicker.kPrimaryLight3,
                      ),
                      Container(
                        width: 2,
                        height: 80,
                        color: ColorPicker.kPrimaryLight3,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 270,
                        child: CommonWidget.text(
                          'OR IMPORT YOURDETAILS FROM',
                          style: FontTextStyle.kWhite13W700SSP,
                        ),
                      ),
                      SB.SH15(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            height: 45,
                            width: 80,
                            decoration: BoxDecoration(
                              color: ColorPicker.kSocial,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Image.asset('assets/icons/fb.png'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            height: 45,
                            width: 80,
                            decoration: BoxDecoration(
                              color: ColorPicker.kRedGoogle,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Image.asset('assets/icons/gp.png'),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 80,
                            decoration: BoxDecoration(
                              color: ColorPicker.kGreen,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Image.asset('assets/icons/x.png'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SB.SH10(),
            ],
          ),
        ],
      ),
    );
  }
}
