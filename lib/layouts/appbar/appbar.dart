import 'package:flutter/material.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/common/common_widget.dart';
import 'package:holedo/presentation/utill/images.dart';
import '../../models/models.dart';

class AppBarTopMobile extends AppBar {
  Widget build(BuildContext context) {
    // ExcludeSemantics is a work-around for a bug in Flutter web engine
    return PreferredSize(
      preferredSize: Size.fromHeight(46),
      child: Container(
          height: 46,
          color: ColorPicker.kPrimaryLight1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
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
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.all(3),
                child: TextFormField(
                  cursorColor: ColorPicker.kWhite,
                  style: FontTextStyle.kWhite16W400SSP,
                  decoration: InputDecoration(
                    hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
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
              Container(
                width: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget.text('Home',
                        style: FontTextStyle.kWhite16W400SSP),
                    CommonWidget.text('Profile',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('News',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('Jobs',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('Recruitment',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('Help',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
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
                      BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                )),
                child: Center(
                    child: Stack(
                  //overflow: Overflow.visible,
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
                          child: CommonWidget.text(
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
                  vertical:
                      BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                )),
                child: Center(
                    child: Stack(
                  //overflow: Overflow.visible,
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
                          child: CommonWidget.text(
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
                  vertical:
                      BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
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
                        child: CommonWidget.text('352',
                            style: FontTextStyle.kPrimaryLight10W700SSP),
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
                      BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                )),
                child: Center(
                  child: Container(
                    height: 26,
                    width: 26,
                    child: Image(
                      image: AssetImage(Images.avatar),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class AppBarTop extends AppBar {
  Widget build(BuildContext context) {
    // ExcludeSemantics is a work-around for a bug in Flutter web engine
    return PreferredSize(
      preferredSize: Size.fromHeight(46),
      child: Container(
          height: 46,
          color: ColorPicker.kPrimaryLight1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
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
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.all(3),
                child: TextFormField(
                  cursorColor: ColorPicker.kWhite,
                  style: FontTextStyle.kWhite16W400SSP,
                  decoration: InputDecoration(
                    hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
                    filled: true,
                    fillColor: ColorPicker.kPrimaryLight,
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPicker.kPrimary),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPicker.kPrimary),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPicker.kPrimary),
                        borderRadius: BorderRadius.circular(5)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorPicker.kPrimaryLightBlue,
                    ),
                    suffixIcon: Container(
                      margin: EdgeInsets.only(right: 5, bottom: 5, top: 5),
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
              Container(
                width: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidget.text('Home',
                        style: FontTextStyle.kWhite16W400SSP),
                    CommonWidget.text('Profile2',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('News3',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('Jobs4',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('Recruitment6',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                    CommonWidget.text('Help',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Container(
                width: Get.width * 0.05,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorPicker.kPrimaryLight, width: 3),
                        right: BorderSide(
                            color: ColorPicker.kPrimaryLight, width: 3))),
                child: Center(
                    child: Stack(
                  //overflow: Overflow.visible,
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
                          child: CommonWidget.text(
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
                    border: Border(
                        right: BorderSide(
                            color: ColorPicker.kPrimaryLight, width: 3))),
                child: Center(
                    child: Stack(
                  //overflow: Overflow.visible,
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
                          child: CommonWidget.text(
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
                    border: Border(
                        right: BorderSide(
                            color: ColorPicker.kPrimaryLight, width: 3))),
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
                        child: CommonWidget.text('352',
                            style: FontTextStyle.kPrimaryLight10W700SSP),
                      ),
                    ),
                  ],
                )),
              ),
              Container(
                width: Get.width * 0.05,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: ColorPicker.kPrimaryLight, width: 3))),
                child: Center(
                  child: Container(
                    height: 26,
                    width: 26,
                    child: Image(
                      image: AssetImage(Images.avatar),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
