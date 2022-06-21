import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
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
    // final isCurrent = currentPath.startsWith(widget.path);

    return Container(
      color: Cr.colorPrimary,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.logo1,
            width: Di.FSOTL + 10,
          ),
          Di.SBWD,
          AppbarTextField(
            onSearchChange: widget.onSearch,
            searchController: widget.searchController,
          ),
          Di.SBWD,
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

          Di.SBWL,

          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),
          CustomIconButton(
            icon: SvgPicture.asset(
              Svgs.emailOpen,
              color: Cr.darkBlue9,
            ),
            // iconData: Icons.mail_rounded,
            showNotification: true,
          ),
          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          CustomIconButton(
            icon: SvgPicture.asset(
              Svgs.flag,
              color: Cr.darkBlue9,
            ),
            showNotification: true,
          ),

          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          Row(
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
          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          PersonAvatar(),

          VerticalDivider(
            thickness: 1.3,
            color: Cr.darkBlue5,
          ),

          // Recruitment
        ],
      ),
    );
  }
}
