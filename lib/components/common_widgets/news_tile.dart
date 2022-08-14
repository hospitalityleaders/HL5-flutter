import 'package:flutter/material.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/utils/asset_image.dart';
import 'package:holedo/utils/strings.dart';

import '../../constant/colorPicker/color_picker.dart';

class NewsTile extends StatelessWidget {
  final double height;
  final double width;
  const NewsTile({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey, blurRadius: 10.0, offset: Offset(-0.0, 0.0))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 174,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageAssets.publicPicture), fit: BoxFit.fill)),
          ),
          Text(
            Strings.howTechnologyCanDeliver,
            style: FontTextStyle.kBlueDark180W700SSP,
          ),
          RichText(
              text: TextSpan(text: Strings.by, style: FontTextStyle.kGreyLight5146W400SSP, children: [
            TextSpan(
              text: Strings.abdal,
              style: FontTextStyle.kGreyLight5146W600SSP,
            ),
            buildDotText(),
            TextSpan(text: Strings.date, style: FontTextStyle.kGreyLight5146W400SSP)
          ])),
          SB.SH10(),
          Container(
            decoration: BoxDecoration(color: ColorPicker.kRed.withOpacity(0.5), borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(5),
            child: Text(
              Strings.memberOnly,
              style: FontTextStyle.kRed14W400PR,
            ),
          )
        ],
      ),
    );
  }

  TextSpan buildDotText() {
    return TextSpan(
      text: Strings.dot,
      style: FontTextStyle.kGreyLight5146W600SSP,
    );
  }
}
