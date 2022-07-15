import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/profile/presentation/ui/components/onhover.dart';
import 'package:holedo/profile/presentation/ui/components/person_avatar.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/images.dart';
import 'package:holedo/profile/presentation/utill/nav.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class ContactCardDialogWidget extends ConsumerWidget {
  const ContactCardDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userProfileData = ref.watch(profileNotifierProvider).userProfileData!;
    return Container(
      color: Cr.whiteColor,
      width: 560,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PersonAvatar(
                avatarSize: 85,
              ),
              Di.SBCW(18),
              Container(
                width: 400,
                padding: const EdgeInsets.only(
                  left: 18,
                  bottom: Di.PSL,
                  top: Di.PSL,
                  right: Di.PSL,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _FullName(),
                    _ProfessionalTitle(),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: Di.PSL),
                child: GestureDetector(
                  onTap: () => Nav.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: Cr.accentBlue1,
                  ),
                ),
              ),
              Di.SBWL,
            ],
          ),
          Di.DWZH,
          Container(
            padding: const EdgeInsets.all(Di.PSL),
            child: Column(
              children: [
                if (userProfileData.fullName != null)
                  ProfileCardListTile(
                    text: userProfileData.fullName!,
                    iconData: Icons.email,
                  ),
                if (userProfileData.contactNumber != null)
                  ProfileCardListTile(
                    text: userProfileData.contactNumber!,
                    iconData: Icons.phone,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ProfileSquareCard(
                          Icons.phone,
                          showBlue: true,
                        ),
                        const ProfileSquareCard(
                          Icons.whatsapp,
                          showBlue: true,
                        ),
                        ProfileSquareCard(
                          FontAwesomeIcons.solidMessage,
                          showBlue: true,
                          icon: Center(
                            child: Text(
                              'SMS',
                              style: dividerTextSmall.copyWith(
                                color: Cr.accentBlue1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (userProfileData.skype != null)
                  ProfileCardListTile(
                    text: userProfileData.skype.toString(),
                    iconData: FontAwesomeIcons.skype,
                  ),
                if (userProfileData.website != null)
                  ProfileCardListTile(
                    text: userProfileData.website.toString(),
                    icon: SvgPicture.asset(
                      Svgs.link,
                      color: Cr.accentBlue1,
                      width: 18,
                    ),
                  ),
              ],
            ),
          ),
          Di.SBHD,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ProfileSquareCard(
                Icons.facebook,
              ),
              ProfileSquareCard(
                FontAwesomeIcons.twitter,
              ),
              ProfileSquareCard(
                FontAwesomeIcons.linkedin,
              ),
              ProfileSquareCard(
                FontAwesomeIcons.xing,
              ),
            ],
          ),
          Di.SBCH(50),
        ],
      ),
    );
  }
}

class _ProfessionalTitle extends ConsumerWidget {
  const _ProfessionalTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Text(
      ref.watch(profileNotifierProvider).userProfileData!.professionalTitle ??
          "",
      style: bodyLarge.copyWith(
        color: Cr.darkGrey1,
      ),
    );
  }
}

class _FullName extends ConsumerWidget {
  const _FullName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Text(
      ref.watch(profileNotifierProvider).userProfileData!.fullName ?? "",
      style: h2Regular,
    );
  }
}

class ProfileSquareCard extends StatelessWidget {
  const ProfileSquareCard(
    this.iconData, {
    Key? key,
    this.showBlue = false,
    this.icon,
  }) : super(key: key);

  final bool showBlue;
  final Widget? icon;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: showBlue
          ? BoxDecoration(
              color: showBlue ? Cr.accentBlue3 : null,
              border: Border.all(
                color: Cr.accentBlue2,
              ),
              borderRadius: BorderRadius.circular(2),
            )
          : null,
      margin: const EdgeInsets.only(left: Di.PSES),
      child: icon ??
          Icon(
            iconData,
            size: 18,
            color: Cr.accentBlue1,
          ),
    );
  }
}

class ProfileCardListTile extends StatelessWidget {
  const ProfileCardListTile({
    Key? key,
    required this.text,
    this.iconData,
    this.icon,
    this.trailing,
    this.removePadding = false,
  }) : super(key: key);
  final String text;
  final IconData? iconData;
  final Widget? icon;
  final Widget? trailing;
  final bool removePadding;

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (bool isHovered) {
        return Container(
          padding: removePadding
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(vertical: 14, horizontal: Di.PSL),
          color: isHovered ? Cr.accentBlue3 : Cr.whiteColor,
          child: Row(
            children: [
              icon ??
                  Icon(
                    iconData,
                    color: Cr.accentBlue1,
                    size: 18,
                  ),
              Di.SBCW(18),
              Text(
                text,
                style: bodyLarge.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              if (trailing != null) ...[
                const Spacer(),
                trailing!,
              ]
            ],
          ),
        );
      },
    );
  }
}
