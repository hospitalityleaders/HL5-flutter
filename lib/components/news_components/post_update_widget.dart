import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widget.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/fontStyle/font_style.dart';
import '../../../../constant/sizedbox.dart';

class PostUpdateWidget extends StatelessWidget {
  const PostUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 500,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(0, 4), color: ColorPicker.kShadow1.withOpacity(0.15), blurRadius: 30),
      ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/share.png',
                height: 130,
                width: 130,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget.text(
                    'Hello Noberto',
                    style: FontTextStyle.kPrimary20W600PR,
                  ),
                  SB.SH15(),
                  SizedBox(
                    width: Get.width * 0.21,
                    child: CommonWidget.text(
                      'What’s news today? Share an update, link or news article with your connections. Get out there!',
                      style: FontTextStyle.kGreyLight18W600PR.copyWith(fontSize: 12, height: 1.5),
                    ),
                  ),
                ],
              )
            ],
          ),
          SB.SH25(),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/profile.png')),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                height: 50,
                width: 330,
                margin: EdgeInsets.only(right: 45),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), border: Border.all(color: ColorPicker.kBorder, width: 1), color: ColorPicker.kGreyLight2),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: FontTextStyle.kGreyLight318W600PR.copyWith(fontSize: 12),
                      contentPadding: EdgeInsets.only(top: 13, left: 10, bottom: 10),
                      hintText: 'Share an update or link.....'),
                  style: FontTextStyle.kGreyLight318W600PR,
                ),
              )
            ],
          ),
          SB.SH25(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 45),
                height: 38,
                width: 130,
                decoration: BoxDecoration(
                  color: ColorPicker.kBlueLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: CommonWidget.text('Post Update', style: FontTextStyle.kWhite18W600PR.copyWith(fontSize: 12)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
