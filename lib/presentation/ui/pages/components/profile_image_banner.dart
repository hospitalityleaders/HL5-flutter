import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/application/shared/providers.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/data/presentation_data.dart';
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

class ProfileImageBanner extends ConsumerStatefulWidget {
  const ProfileImageBanner({
    Key? key,
    this.onEditButtonPressed,
    required this.userProfileData,
  }) : super(key: key);

  final void Function()? onEditButtonPressed;

  final User userProfileData;

  @override
  ConsumerState<ProfileImageBanner> createState() => _ProfileImageBannerState();
}

class _ProfileImageBannerState extends ConsumerState<ProfileImageBanner> {
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
            width: 560,
            margin: const EdgeInsets.only(top: 50),
            color: Cr.whiteColor,
            padding: const EdgeInsets.all(Di.PSD),
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
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
                          widget.userProfileData.professionalTitle.toString(),
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
                if (showProfileSubMenu)
                  const Positioned(
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
        ),
        const Positioned.fill(
          top: 10,
          child: Align(
            alignment: Alignment.topCenter,
            child: PersonAvatar(avatarSize: 75),
          ),
        ),

        if (ref.watch(profileNotifierProvider).isProfileEditable)
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

        if (ref.watch(profileNotifierProvider).isProfileEditable)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Container(
                  width: 560,
                  height: 385,
                  color: Cr.accentBlue2.withOpacity(.8),
                  padding: const EdgeInsets.all(Di.PSD),
                ),
              ],
            ),
          )
        else
          Di.ESB,

        if (ref.watch(profileNotifierProvider).isProfileEditable)
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
          )
        else
          Di.ESB,
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
//       decoration: boxDecorationRounded.copyWith(
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
