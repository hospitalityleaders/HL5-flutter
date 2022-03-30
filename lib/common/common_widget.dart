import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colorPicker/color_picker.dart';
import '../constant/fontStyle/font_style.dart';
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
        height: 100,
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
}
