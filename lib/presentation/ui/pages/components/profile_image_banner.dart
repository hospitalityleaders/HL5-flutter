import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileImageBanner extends StatelessWidget {
  const ProfileImageBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Di.getScreenSize(context).width,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/t6.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          // height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Container(
                width: 560,
                height: 385,
                color: Cr.whiteColor,
                padding: EdgeInsets.all(Di.PSD),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomOutlinedButton(
                          text: "Contact card",
                          icon: SvgPicture.asset(
                            "assets/svgicons/card-account-phone.svg",
                            height: 12,
                            color: Cr.darkGrey1,
                          ),
                        ),
                        CustomOutlinedButton(
                          icon: Icon(
                            Icons.menu,
                            size: 12,
                            color: Cr.darkGrey1,
                          ),
                          textWidget: Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 12,
                            color: Cr.darkGrey1,
                          ),
                        ),
                      ],
                    ),
                    Di.SBHD,
                    Text(
                      "Noberto Holden",
                      style: display1,
                    ),
                    Text(
                      "Business development manager, recruiter and hotel specialist.",
                      style: bodyLarge.copyWith(
                        color: Cr.darkGrey1,
                      ),
                    ),
                    Di.SBHES,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Cr.darkGrey1,
                          size: 12,
                        ),
                        Text(
                          " Cape Town, South Africa",
                          style: bodySmallRegular.copyWith(
                            color: Cr.darkGrey1,
                          ),
                        ),
                      ],
                    ),
                    Di.SBHL,
                    CustomElevatedButton(
                      width: 285,
                      height: 55,
                      text: "SEND CONNECTION REQUEST",
                      icon: Icon(
                        Icons.person_add,
                      ),
                    ),
                    Di.SBHES,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          width: 140,
                          height: 35,
                          backgroundColor: Cr.accentBlue3,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check,
                                color: Cr.accentBlue1,
                                size: 12,
                              ),
                              Di.SBWES,
                              Text(
                                "Write reference",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Di.SBWES,
                        CustomElevatedButton(
                          width: 140,
                          height: 35,
                          backgroundColor: Cr.accentBlue3,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // thumb-up.svg.    "assets/svgicons/thumb-up.svg",
                              SvgPicture.asset(
                                "assets/svgicons/thumb-up.svg",
                                color: Cr.accentBlue1,
                                width: 12,
                              ),

                              Di.SBWES,
                              Text(
                                "Recommend",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                            ],
                          ),
                          borderColor: Cr.accentBlue2,
                        ),
                      ],
                    ),
                    Di.SBHOTL,
                    SizedBox(
                      height: 55,
                      width: 520,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "250+",
                                style: h2Regular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              Text(
                                "CONNECTIONS",
                                style: dividerTextSmall.copyWith(
                                  color: Cr.grey1,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "14k",
                                style: h2Regular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              Text(
                                "Leader Points".toUpperCase(),
                                style: dividerTextSmall.copyWith(
                                  color: Cr.grey1,
                                ),
                              ),
                            ],
                          ),
                          Image.asset("assets/images/badge.png"),
                          Column(
                            children: [
                              Text(
                                "3",
                                style: h2Regular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              Text(
                                "REFERENCES",
                                style: dividerTextSmall.copyWith(
                                  color: Cr.grey1,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "312",
                                style: h2Regular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              Text(
                                "RECOMMENDATIONS",
                                style: dividerTextSmall.copyWith(
                                  color: Cr.grey1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 40,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 75,
              height: 75,
              decoration: Styles.boxDecorationRounded.copyWith(
                image: DecorationImage(
                  image: AssetImage("assets/images/avatar.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    this.text,
    this.icon,
    this.textWidget,
  }) : super(key: key);

  final String? text;
  final Widget? textWidget;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null ? icon! : Di.ESB,
          Di.SBWES,
          textWidget ??
              Text(
                text ?? "",
                style: bodySmallRegular.copyWith(
                  color: Cr.darkGrey1,
                ),
              ),
        ],
      ),
    );
  }
}

// "assets/svgicons/card-account-phone.svg",
            // "Contact card",
// 
