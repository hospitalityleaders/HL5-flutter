import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/onhover.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileSubMenuPopup extends StatelessWidget {
  const ProfileSubMenuPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Di.PSES),
      child: ListView(
        children: [
          _SubMenuWidget(
            text: "View profile",
          ),
          _SubMenuWidget(
            text: "Account settings",
          ),
          _SubMenuWidget(
            text: "Privacy settings",
          ),
          _SubMenuWidget(
            text: "Log out",
          ),
        ],
      ),
    );
  }
}

class _SubMenuWidget extends StatelessWidget {
  const _SubMenuWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (bool isHovered) {
        return Container(
          color: isHovered ? Colors.white.withOpacity(.07) : Cr.colorPrimary,
          child: ListTile(
            title: Text(text,
                style: defaultRegular.copyWith(
                  color: Cr.grey1,
                  fontWeight: isHovered ? FontWeight.w500 : null,
                )
                //  TextStyle(
                //   color: Cr.grey1,
                //   fontWeight: isHovered ? FontWeight.w500 : null,
                // ),
                ),
          ),
        );
      },
    );
  }
}
