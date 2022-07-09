import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/contact_card_dialog_widget.dart';
import 'package:holedo/presentation/ui/components/custom_outlined_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/rounded_icon_button.dart';
import 'package:holedo/presentation/ui/pages/mobile_desktop_comman_components/mobile_desktop_comman_components.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_cover_image_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_edit_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:tap_canvas/tap_canvas.dart';

class ProfileImageBanner extends StatefulWidget {
  const ProfileImageBanner({
    Key? key,
    this.onEditButtonPressed,
    required this.userProfileData,
  }) : super(key: key);

  final void Function()? onEditButtonPressed;

  final User userProfileData;

  @override
  State<ProfileImageBanner> createState() => _ProfileImageBannerState();
}

class _ProfileImageBannerState extends State<ProfileImageBanner> {
  bool showProfileSubMenu = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Di.getScreenSize(context).width,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.userProfileData.banner ??
                    "https://images.pexels.com/photos/313782/pexels-photo-313782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              ),
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
                child: Stack(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomOutlinedButton(
                                onPressed: () {
                                  showCustomDialog(
                                    context,
                                    ContactCardDialogWidget(),
                                  );
                                },
                                text: "Contact card",
                                icon: SvgPicture.asset(
                                  "assets/svgicons/card-account-phone.svg",
                                  height: 12,
                                  color: Cr.darkGrey1,
                                ),
                              ),
                              Di.ESB,
                              TapOutsideDetectorWidget(
                                onTappedInside: () {
                                  setState(() {
                                    showProfileSubMenu = !showProfileSubMenu;
                                  });
                                },
                                onTappedOutside: () {
                                  setState(() {
                                    showProfileSubMenu = false;
                                  });
                                },
                                child: CustomOutlinedButton(
                                  onPressed: () {},
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
                              ),
                            ],
                          ),
                          // ContactCardMenuCommon(
                          //   onPressed: () {
                          //     setState(() {
                          //       showProfileSubMenu = !showProfileSubMenu;

                          //     });
                          //   },
                          // ),
                          Di.SBHD,
                          Text(
                            widget.userProfileData.fullName ?? "",
                            style: display2,
                          ),
                          Center(
                            child: SizedBox(
                              width: 450,
                              child: Text(
                                widget.userProfileData.professionalTitle
                                    .toString(),
                                // ??
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: bodyLarge.copyWith(
                                  color: Cr.darkGrey1,
                                ),
                              ),
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
                                widget.userProfileData.area ?? "",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.darkGrey1,
                                ),
                              ),
                            ],
                          ),
                          Di.SBHL,
                          SendConnectionRequestButton(),
                          Di.SBHES,
                          WriteReferenceRecommandButtonComman(
                            userProfileData: widget.userProfileData,
                          ),
                          Di.SBHOTL,
                          StatsComman(
                            userProfileData: widget.userProfileData,
                          ),
                        ],
                      ),
                    ),
                    if (showProfileSubMenu)
                      Positioned(
                        top: 30,
                        right: 0,
                        child: SizedBox(
                          width: 245,
                          child: SizedBox(
                            width: 245,
                            child: ProfileCardSubMenu(),
                          ),
                        ),
                      ),
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
            child: PersonAvatar(avatarSize: 75),
          ),
        ),

        if (Provider.of<ProfileProvider>(context).isProfileEditable)
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: Cr.accentBlue1,
              child: Icon(Icons.camera_alt),
              onPressed: () {
                showCustomDialog(
                  context,
                  ProfileCoverImageDialogWidget(),
                );
              },
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
            ? Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: RoundeIconButton(
                    onPressed: () {
                      showCustomDialog(
                        context,
                        Container(
                          // margin: const EdgeInsets.symmetric(vertical: 100),
                          child: ProfileEditDialogWidget(
                            userProfileData: widget.userProfileData,
                          ),
                        ),
                      );
                    },
                    backgroundColor: Cr.accentBlue1,
                    icon: Icon(
                      Icons.edit,
                      color: Cr.whiteColor,
                    ),
                  ),
                ),
              )
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

// class ProfileAvatar extends StatelessWidget {
//   const ProfileAvatar({
//     Key? key,
//     this.doubleWidthHeight,
//   }) : super(key: key);

//   final double? doubleWidthHeight;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: doubleWidthHeight ?? 75,
//       height: doubleWidthHeight ?? 75,
//       decoration: Styles.boxDecorationRounded.copyWith(
//         image: DecorationImage(
//           image:
//               NetworkImage(DbData.getUserProfileData.avatar?.toString() ?? ""),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

// "assets/svgicons/card-account-phone.svg",
// "Contact card",
//


