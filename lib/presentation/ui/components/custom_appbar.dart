import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/submenus.dart';

import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
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
    final appState = Provider.of<AppState>(context);
    final menuItems = Get.put(HoledoDatabase()).menuItems;
    final isSmallerThanDesltop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);

    return Container(
      color: Cr.colorPrimary,
      height: 45,
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
              VerticalDivider(
                thickness: 1.3,
                color: Cr.darkBlue5,
              ),
              AppbarEmailButton(),
              VerticalDivider(
                thickness: 1.3,
                color: Cr.darkBlue5,
              ),
              AppbarNotificationsButton(),
              VerticalDivider(
                thickness: 1.3,
                color: Cr.darkBlue5,
              ),
              AppbarConnectionRequestButton(),
              VerticalDivider(
                thickness: 1.3,
                color: Cr.darkBlue5,
              ),
              _ProfileWithSubMenu(),
              VerticalDivider(
                thickness: 1.3,
                color: Cr.darkBlue5,
              ),
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
  }) : super(key: key);

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: SvgPicture.asset(
        Svgs.emailOpen,
        color: Cr.darkBlue9,
      ),
      // iconData: Icons.mail_rounded,
      showNotification: true,
    );
  }
}

class _ProfileWithSubMenu extends StatelessWidget {
  const _ProfileWithSubMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: true,
      onHover: (_) => showProfileHoverSubmenu(context),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/avatar.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class AppbarConnectionRequestButton extends StatelessWidget {
  const AppbarConnectionRequestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          opaque: true,
          onHover: (_) => showProfileConnectionRequest(context),
          child: Icon(
            Icons.person_add,
            color: Cr.darkBlue9,
          ),
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
    );
  }
}
