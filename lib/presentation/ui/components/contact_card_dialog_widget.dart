import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/presentation/ui/components/onhover.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ContactCardDialogWidget extends StatelessWidget {
  const ContactCardDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.whiteColor,
      width: 560,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              PersonAvatar(
                avatarSize: 85,
              ),
              Di.SBCW(18),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  bottom: Di.PSL,
                  top: Di.PSL,
                  right: Di.PSL,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Noberto Holden",
                      style: h2Regular,
                    ),
                    Text(
                      "General Manager, Four Seasons",
                      style: bodyLarge.copyWith(
                        color: Cr.darkGrey1,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Nav.pop(context),
                child: Icon(
                  Icons.close,
                  color: Cr.accentBlue1,
                ),
              ),
              Di.SBWL,
            ],
          ),
          Di.DWZH,
          Container(
            padding: EdgeInsets.all(Di.PSL),
            child: Column(
              children: [
                _ContactCardListTile(
                  text: "noberto@gmail.com",
                  iconData: Icons.email,
                ),
                _ContactCardListTile(
                  text: "+27 72 987 5467",
                  iconData: Icons.phone,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _IconContactCard(
                        Icons.phone,
                        showBlue: true,
                      ),
                      _IconContactCard(
                        Icons.whatsapp,
                        showBlue: true,
                      ),
                      _IconContactCard(
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
                _ContactCardListTile(
                  text: "Noberto.Holden",
                  iconData: FontAwesomeIcons.skype,
                ),
                _ContactCardListTile(
                  text: "www.nobertoholden.com",
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
            children: [
              _IconContactCard(
                Icons.facebook,
              ),
              _IconContactCard(
                FontAwesomeIcons.twitter,
              ),
              _IconContactCard(
                FontAwesomeIcons.googlePlusG,
              ),
              _IconContactCard(
                FontAwesomeIcons.linkedin,
              ),
              _IconContactCard(
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

class _IconContactCard extends StatelessWidget {
  const _IconContactCard(
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
                width: 1,
                color: Cr.accentBlue2,
              ),
              borderRadius: BorderRadius.circular(2),
            )
          : null,
      margin: EdgeInsets.only(left: Di.PSES),
      child: icon ??
          Icon(
            iconData,
            size: 18,
            color: Cr.accentBlue1,
          ),
    );
  }
}

class _ContactCardListTile extends StatelessWidget {
  const _ContactCardListTile({
    Key? key,
    required this.text,
    this.iconData,
    this.icon,
    this.trailing,
  }) : super(key: key);
  final String text;
  final IconData? iconData;
  final Widget? icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (bool isHovered) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: Di.PSL),
          color: isHovered ? Cr.accentBlue3 : Cr.whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                Spacer(),
                trailing!,
              ]
            ],
          ),
        );
      },
    );
  }
}
