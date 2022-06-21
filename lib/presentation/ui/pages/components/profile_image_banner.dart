import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/edit_icon_buttton.dart';
import 'package:holedo/presentation/ui/pages/mobile_desktop_comman_components/mobile_desktop_comman_components.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileImageBanner extends StatelessWidget {
  const ProfileImageBanner({
    Key? key,
    this.onEditButtonPressed,
    this.userProfileData,
  }) : super(key: key);

  final void Function()? onEditButtonPressed;

  // final String? fullName;
  // final String? avatarUrl;
  // final String? userTitleTypesId;
  final User? userProfileData;

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
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
          ),
        ),
        Center(
          // height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                width: 560,
                height: 385,
                color: Cr.whiteColor,
                padding: EdgeInsets.all(Di.PSD),
                child: Column(
                  children: [
                    ContactCardMenuCommon(),
                    Di.SBHD,
                    Text(
                      userProfileData?.fullName ?? "Noberto Holden",
                      style: display1,
                    ),
                    Text(
                      // userProfileData?.profileVideoDescription.toString() ??
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
                    SendConnectionRequestComman(),
                    Di.SBHES,
                    WriteReferenceRecommandButtonComman(),
                    Di.SBHOTL,
                    StatsComman(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 10,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 75,
              height: 75,
              decoration: Styles.boxDecorationRounded.copyWith(
                image: DecorationImage(
                  image:
                      // avatarUrl != null
                      //     ?
                      NetworkImage(userProfileData?.avatar?.toString() ?? ""),
                  // : AssetImage("assets/images/avatar.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Provider.of<ProfileProvider>(context).isProfileEditable
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Container(
                      width: 560,
                      height: 385,
                      color: Cr.accentBlue2.withOpacity(.8),
                      padding: EdgeInsets.all(Di.PSD),
                    ),
                  ],
                ),
              )
            : Di.ESB,
        Provider.of<ProfileProvider>(context).isProfileEditable
            ? EditIconButton(onPressed: onEditButtonPressed)
            : Di.ESB,
        //     Positioned.fill(
        //   top: 10,
        //   child: Align(
        //     alignment: Alignment.topCenter,
        //     child: ,
        //   ),
        // ),
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
