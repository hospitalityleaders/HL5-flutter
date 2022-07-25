import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/data/presentation_data.dart';
import 'package:holedo/profile/presentation/ui/components/contact_card_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/components/custom_outlined_button.dart';
import 'package:holedo/profile/presentation/ui/components/person_avatar.dart';
import 'package:holedo/profile/presentation/ui/components/rounded_icon_button.dart';
import 'package:holedo/profile/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/profile/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_desktop_comman_components/mobile_desktop_comman_components.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_cover_image_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/profile_edit_dialog_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/images.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
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
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Stack(
      children: [
        Container(
          width: Di.getScreenSize(context).width,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.userProfileData.banner ??
                    "https://images.pexels.com/photos/269077/pexels-photo-269077.jpeg",
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
          child: Container(
            margin: const EdgeInsets.only(top: 12),
            width: 560,
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Container(
                    color: Cr.whiteColor,
                    margin: const EdgeInsets.only(top: 38),
                    padding: const EdgeInsets.all(Di.PSD),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlinedButton(
                              onPressed: () {
                                showCustomDialog(
                                  context,
                                  const ContactCardDialogWidget(),
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
                                icon: const Icon(
                                  Icons.menu,
                                  size: 12,
                                  color: Cr.darkGrey1,
                                ),
                                textWidget: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  size: 12,
                                  color: Cr.darkGrey1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Di.SBHD,
                        Text(
                          widget.userProfileData.fullName ?? "",
                          textAlign: TextAlign.center,
                          style: display2,
                        ),
                        Center(
                          child: SizedBox(
                            width: 450,
                            child: Text(
                              (widget.userProfileData.professionalTitle ?? "")
                                  .toString(),
                              // ??
                              textAlign: TextAlign.center,
                              style: bodyLarge.copyWith(
                                color: Cr.darkGrey1,
                              ),
                            ),
                          ),
                        ),
                        Di.SBHES,
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Cr.darkGrey1,
                                size: 12,
                              ),
                              Di.SBWES,
                              Text(
                                (widget.userProfileData.area ?? "") +
                                    (widget.userProfileData.countryId != null
                                        ? (", ${countries[widget.userProfileData.countryId!.toString()] ?? ""}")
                                        : ""),
                                style: bodySmallRegular.copyWith(
                                  color: Cr.darkGrey1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Di.SBHL,
                        const SizedBox(
                          child: Center(
                            child: SendConnectionRequestButton(),
                          ),
                        ),
                        if (!profileProvider.isMyProfile) ...[
                          Di.SBHES,
                          WriteReferenceRecommandButtonComman(
                            userProfileData: widget.userProfileData,
                          ),
                        ],
                        Di.SBHOTL,
                        StatsComman(
                          userProfileData: widget.userProfileData,
                        ),
                      ],
                    ),
                  ),
                  // if (showProfileSubMenu)

                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: PersonAvatar(avatarSize: 76),
                    ),
                  ),
                  if (showProfileSubMenu)
                    Positioned(
                      top: 82,
                      right: 14,
                      child: CustomSubMenu(
                        customSubMenuItems: [
                          CustomSubmenuItem(
                            onTap: () {},
                            width: 245,
                            textIconColor: Cr.accentBlue1,
                            textStyle: bodySmallRegular.copyWith(
                              color: Cr.accentBlue1,
                            ),
                            icon: SvgPicture.asset(
                              Svgs.cardAccountPhone,
                              width: 16,
                              color: Cr.accentBlue1,
                            ),
                            text: "Share profile",
                          ),
                          CustomSubmenuItem(
                            onTap: () {},
                            width: 245,
                            textIconColor: Cr.accentBlue1,
                            textStyle: bodySmallRegular.copyWith(
                              color: Cr.accentBlue1,
                            ),
                            icon: SvgPicture.asset(
                              Svgs.close,
                              width: 16,
                              color: Cr.accentBlue1,
                            ),
                            text: "Cancel connecttion",
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: EditBlueCardSheet(
                      context,
                      greenCardText: "greenCardText",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (Provider.of<ProfileProvider>(
          context,
        ).isProfileEditable)
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: Cr.accentBlue1,
              child: const Icon(Icons.camera_alt),
              onPressed: () {
                showCustomDialog(
                  context,
                  const ProfileCoverImageDialogWidget(),
                );
              },
            ),
          ),
        if (Provider.of<ProfileProvider>(context).isProfileEditable)
          Positioned.fill(
            child: Align(
              child: RoundeIconButton(
                onPressed: () {
                  showCustomDialog(
                    context,
                    ProfileEditDialogWidget(
                      userProfileData: widget.userProfileData,
                    ),
                  );
                },
                backgroundColor: Cr.accentBlue1,
                icon: const Icon(
                  Icons.edit,
                  color: Cr.whiteColor,
                ),
              ),
            ),
          ),
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
//       decoration: boxDecorationRounded.copyWith(
//         image: DecorationImage(
//           image:
//               NetworkImage(Provider.of<ProfileProvider>(context).userProfileData!.avatar?.toString() ?? ""),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

// "assets/svgicons/card-account-phone.svg",
// "Contact card",
//
