import 'package:flutter/material.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/utils/asset_image.dart';
import 'package:holedo/utils/strings.dart';

import '../../responsive/common_responsive_value.dart';

class JobTile extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  const JobTile({required this.width, required this.height, this.margin});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey, blurRadius: 15.0, offset: Offset(0.0, 0.75))],
      ),
      margin: margin ?? EdgeInsets.only(right: CommonResponsiveValue.genericDouble(context, 20, 20), bottom: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [BackgroundImageWidget(), JobInfoSection()],
          ),
          AirbnbImage()
        ],
      ),
    );
  }
}

class AirbnbImage extends StatelessWidget {
  const AirbnbImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 30,
        top: 130,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: AssetImage(ImageAssets.airbnb), fit: BoxFit.fill)),
        ));
  }
}

class JobInfoSection extends StatelessWidget {
  const JobInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SB.SH20(),
          Text(
            Strings.guestServiceManager,
            style: FontTextStyle.kBlueDark160W700SSP,
          ),
          SB.SH5(),
          Text(
            Strings.twentyFiveHours,
            style: FontTextStyle.kBlueLight114W400PR,
          ),
          SB.SH5(),
          Text(
            Strings.germany,
            style: FontTextStyle.kGreyLight514W700PR,
          ),
        ],
      ),
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, image: DecorationImage(image: AssetImage(ImageAssets.aloneGirl), fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(color: ColorPicker.kPrimaryLightGreen, borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(5),
            child: Text(
              Strings.premium,
              style: FontTextStyle.kWhite12W600PR,
            ),
          )
        ],
      ),
    );
  }
}
