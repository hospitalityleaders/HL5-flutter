import 'package:flutter/material.dart';
import 'package:holedo/presentation/popups/profile_connection_request_popup.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/onhover.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

class ProfileSubMenuPopup extends StatelessWidget {
  const ProfileSubMenuPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return InkWell(
      onTap: () {},
      onHover: (hover) {
        if (hover == false)
          userProfileProvider.changeSubMenusPopup2State(hover);
      },
      child: Container(
        width: 170,
        height: 220,
        child: ListView(
          shrinkWrap: true,
          children: [
            PopupArrow(),
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
          color: isHovered ? Cr.darkBlue7.withAlpha(220) : Cr.colorPrimary,
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
