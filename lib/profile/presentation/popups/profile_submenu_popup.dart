import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/popups/profile_connection_request_popup.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:routemaster/routemaster.dart';

class ProfileSubMenuPopup extends StatelessWidget {
  const ProfileSubMenuPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context, listen: false);
    return Provider.of<ProfileProvider>(context).profileSubMenuClicked
        ? Di.ESB
        : InkWell(
            onTap: () {},
            onHover: (hover) {
              if (hover == false) {
                Provider.of<ProfileProvider>(context, listen: false)
                    .changeSubMenusPopup2State(hover);
              }
            },
            child: SizedBox(
              width: 170,
              height: 220,
              child: ListView(
                shrinkWrap: true,
                children: appState.isLoggedIn
                    ? [
                        const PopupArrow(),
                        _SubMenuWidget(
                          text: "View profile",
                          onTap: () async {
                            Provider.of<ProfileProvider>(context, listen: false)
                                .changeProfileSubMenuClicked(true);
                            Routemaster.of(context).push("/profile");
                          },
                        ),
                        const _SubMenuWidget(
                          text: "Account settings",
                        ),
                        const _SubMenuWidget(
                          text: "Privacy settings",
                        ),
                        _SubMenuWidget(
                          text: "Log out",
                          onTap: () async {
                            Provider.of<ProfileProvider>(context, listen: false)
                                .changeProfileSubMenuClicked(true);
                            debugPrint("loging out");
                            Routemaster.of(context).push("/logout");

                            // ApiServices _apiServices = ApiServices();
                            // await _apiServices.logout(
                            //     '${Get.put(AuthController()).restoreModel().token}');
                            // Routemaster.of(context).push("/login");
                          },
                        ),
                      ]
                    : [
                        const PopupArrow(),
                        _SubMenuWidget(
                          text: "Login",
                          onTap: () async {
                            Provider.of<ProfileProvider>(context, listen: false)
                                .changeProfileSubMenuClicked(true);
                            Routemaster.of(context).push("/profile");
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
      onHover: (value) => setState(
        () {
          isHovered = value;
        },
      ),
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
