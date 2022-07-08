import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/popups/profile_connection_request_popup.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:routemaster/routemaster.dart';

class ProfileSubMenuPopup extends StatelessWidget {
  const ProfileSubMenuPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Provider.of<ProfileProvider>(context).profileSubMenuClicked
        ? Di.ESB
        : InkWell(
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
                    text: "Log asfadsout",
                    onTap: () async {
                      Provider.of<ProfileProvider>(context, listen: false)
                          .changeProfileSubMenuClicked(true);
                      print("loging out");
                      Routemaster.of(context).push("/login");

                      // ApiServices _apiServices = ApiServices();
                      // await _apiServices.logout(
                      //     '${Get.put(AuthController()).restoreModel().token}');
                      // Routemaster.of(context).push("/login");
                      print("loging out ss");
                    },
                  ),
                ],
              ),
            ),
          );
  }
}

class _SubMenuWidget extends StatefulWidget {
  const _SubMenuWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;

  @override
  State<_SubMenuWidget> createState() => _SubMenuWidgetState();
}

class _SubMenuWidgetState extends State<_SubMenuWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: ((value) => setState(
            () {
              isHovered = value;
            },
          )),
      onTap: widget.onTap ?? () {},
      child: Container(
        color: isHovered ? Cr.darkBlue7.withAlpha(220) : Cr.colorPrimary,
        child: ListTile(
          title: Text(
            widget.text,
            style: defaultRegular.copyWith(
              color: Cr.grey1,
              fontWeight: isHovered ? FontWeight.w500 : null,
            ),
          ),
        ),
      ),
    );
  }
}
