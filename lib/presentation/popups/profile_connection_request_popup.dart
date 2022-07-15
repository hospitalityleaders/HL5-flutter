import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/submenus.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

class ProfileConnectionRequestPopup extends StatelessWidget {
  const ProfileConnectionRequestPopup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (hover) {
        if (hover == false) {
          Provider.of<ProfileProvider>(context, listen: false)
              .changeConectionRequestPopup2State(false);
        }
      },
      child: SizedBox(
        width: 460,
        child: ListView(
          shrinkWrap: true,
          children: [
            const PopupArrow(),
            Container(
              width: 200,
              color: Cr.colorPrimary,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: Di.PSS),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "CONNECTION REQUEST",
                          style: h5Bold.copyWith(color: Cr.whiteColor),
                        ),
                        Di.SBWES,
                        const TextWithBackground(
                          text: "2",
                          textColor: Cr.darkBlue9,
                          padding: 0,
                          paddingHorizantal: 4,
                          backgroundColor: Cr.darkBlue5,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWithBackground(
                          icon: const Icon(
                            Icons.mail,
                            color: Cr.whiteColor,
                            size: 16,
                          ),
                          sizedBoxBetweenIconText: Di.SBWES,
                          text: "Invite people to join",
                          backgroundColor: Cr.whiteColor.withOpacity(.07),
                          textStyle: h5Bold.copyWith(color: Cr.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: Di.PSES,
              color: Cr.whiteColor,
            ),
            const ConnectionRequestAppbarComponent(),
            const ConnectionRequestAppbarComponent(),
            Container(
              color: Cr.whiteColor,
              padding: const EdgeInsets.only(
                top: Di.PSS,
                bottom: Di.PSS,
                left: Di.PSD,
              ),
              child: Text(
                "View all connections",
                style: h5Bold.copyWith(
                  color: Cr.accentBlue1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopupArrow extends StatelessWidget {
  const PopupArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: Di.PSD),
        child: SvgPicture.asset(
          Svgs.menuAboveArrow,
          color: Cr.colorPrimary,
        ),
      ),
    );
  }
}
