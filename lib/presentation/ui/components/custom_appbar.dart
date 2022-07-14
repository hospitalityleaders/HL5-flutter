import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:flutter_svg/svg.dart';
import 'package:holedo/application/shared/providers.dart';
import 'package:holedo/models/models.dart' hide Provider;
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({
    Key? key,
    required this.searchController,
    required this.onSearch,
  }) : super(key: key);

  final TextEditingController searchController;
  final void Function(String? searchText) onSearch;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);
    final menuItems = Get.put(HoledoDatabase()).menuItems;
    final isSmallerThanDesltop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);

    return Container(
      color: Cr.colorPrimary,
      height: 45,
      width: Di.getScreenSize(context).width,
      child: Row(
        mainAxisAlignment: isSmallerThanDesltop
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isSmallerThanDesltop ? Di.SBWES : Di.SBWD,
              Image.asset(
                Images.logo1,
                width: 40,
              ),
              isSmallerThanDesltop ? Di.SBWES : Di.SBWD,
              AppbarTextField(
                width: isSmallerThanDesltop ? 300 : null,
                onSearchChange: widget.onSearch,
                searchController: widget.searchController,
              ),
              isSmallerThanDesltop ? Di.ESB : Di.SBWD,
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final isCurrentPath = RouteData.of(context)
                      .fullPath
                      .startsWith(menuItems[index].path!);

                  return CustomTextButton(
                    onPressed: () {
                      Routemaster.of(context).push(menuItems[index].path!);
                    },
                    text: menuItems[index].title,
                    color: isCurrentPath ? Cr.whiteColor : Cr.darkBlue9,
                  );
                },
              ),
              isSmallerThanDesltop ? Di.ESB : Di.SBWL,
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Di.DVZW,
              AppbarEmailButton(),
              Di.DVZW,
              AppbarNotificationsButton(),
              Di.DVZW,
              AppbarConnectionRequestButton(),
              Di.DVZW,
              _ProfileWithSubMenu(),
              Di.DVZW,
            ],
          ),

          // Recruitment
        ],
      ),
    );
  }
}

class AppbarNotificationsButton extends StatelessWidget {
  const AppbarNotificationsButton({
    Key? key,
    this.isDrawer = false,
  }) : super(key: key);
  final bool isDrawer;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: SvgPicture.asset(
        Svgs.flag,
        color: Cr.darkBlue9,
      ),
      showNotification: true,
    );
  }
}

class AppbarEmailButton extends StatelessWidget {
  const AppbarEmailButton({
    Key? key,
    this.isDrawer = false,
  }) : super(key: key);
  final bool isDrawer;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: SvgPicture.asset(
        Svgs.emailOpen,
        color: Cr.darkBlue9,
        width: isDrawer ? 20 : null,
      ),
      showNotification: true,
    );
  }
}

class _ProfileWithSubMenu extends ConsumerWidget {
  const _ProfileWithSubMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        ProfileSideHover(),
        Column(
          children: [
            ProfileSideHover(
              isInHorizantal: true,
            ),
            InkWell(
              onTap: () {},
              onHover: (hover) async {
                ref
                    .read(profileNotifierProvider.notifier)
                    .changeSubMenusPopupState(hover);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Di.PSS),
                child: Container(
                  width: 26,
                  height: 26,
                  child: (appState.isLoggedIn &&
                          appState.profile?.avatarCdn != null)
                      ? CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(
                              appState.profile!.avatarCdn.toString()),
                        )
                      : Icon(
                          CupertinoIcons.profile_circled,
                          size: 26,
                          color: Colors.grey,
                        ),
                ),
              ),
            )
          ],
        ),
        ProfileSideHover(),
      ],
    );
  }
}

class AppbarConnectionRequestButton extends StatelessWidget {
  const AppbarConnectionRequestButton({
    Key? key,
    this.isDrawer = false,
  }) : super(key: key);
  final bool isDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedboxWithHover(),
        Column(
          children: [
            SizedboxWithHover(
              isInHorizantal: true,
            ),
            InkWell(
              onTap: () {},
              onHover: (hover) async {
                Provider.of(context, listen: false)
                    .changeConectionRequestPopupState(hover);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person_add,
                    color: Cr.darkBlue9,
                  ),
                  Di.SBWES,
                  TextWithBackground(
                    text: "352",
                    textColor: Cr.darkBlue9,
                    padding: 0,
                    paddingHorizantal: 4,
                    backgroundColor: Cr.darkBlue5,
                  )
                ],
              ),
            ),
          ],
        ),
        SizedboxWithHover(),
      ],
    );
  }
}

class SizedboxWithHover extends ConsumerWidget {
  const SizedboxWithHover({
    Key? key,
    this.isInHorizantal = false,
  }) : super(key: key);
  final bool isInHorizantal;

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () {},
      onHover: (hover) {
        Provider.of(context, listen: false)
            .changeConectionRequestPopup2State(false);
      },
      child: isInHorizantal
          ? Container(
              height: 10,
            )
          : Container(
              width: 10,
            ),
    );
  }
}

class ProfileSideHover extends ConsumerWidget {
  const ProfileSideHover({
    Key? key,
    this.isInHorizantal = false,
  }) : super(key: key);
  final bool isInHorizantal;

  @override
  Widget build(BuildContext contex, ref) {
    return InkWell(
      onTap: () {},
      onHover: (hover) {
        ref
            .read(profileNotifierProvider.notifier)
            .changeSubMenusPopup2State(false);
      },
      child: isInHorizantal
          ? Container(
              height: 10,
            )
          : Container(
              width: 10,
            ),
    );
  }
}
