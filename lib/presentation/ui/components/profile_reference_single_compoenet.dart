import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/presentation/functions/helper_functions.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/onhover.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:tap_canvas/tap_canvas.dart';

class ProfileReferenceSingleComponent extends StatefulWidget {
  const ProfileReferenceSingleComponent({
    Key? key,
    this.description,
    this.isMobile = false,
    this.displayShowMoreHideButton = false,
  }) : super(key: key);

  final String? description;
  final bool isMobile;
  final bool displayShowMoreHideButton;

  @override
  State<ProfileReferenceSingleComponent> createState() =>
      _ProfileReferenceSingleComponentState();
}

class _ProfileReferenceSingleComponentState
    extends State<ProfileReferenceSingleComponent> {
  bool showMore = true;

  List<String> getDescription(
    BuildContext context,
  ) {
    if (widget.description == null) {
      return ["", ""];
    } else {
      List<String> descriptionList = HelperFunctions().splitText(
        widget.description!,
        (Di.getScreenSize(context).width / 1200 * 65).toInt(),
      );
      return descriptionList;
    }
  }

  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.isMobile ? null : 360,
          padding: EdgeInsets.symmetric(
            horizontal: Di.PSS,
          ),
          margin: EdgeInsets.only(
            bottom: Di.PSL,
          ),
          decoration:
              Styles.boxDecorationWithShadow.copyWith(color: Cr.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: PersonAvatar(
                  avatarSize: Di.FSOTL + 10,
                ),
                title: Row(
                  children: [
                    Text(
                      "Sarah Lee",
                      style: h4Bold,
                    ),
                    Di.SBWES,
                    Text(
                      "MHL",
                      style: dividerTextSmall,
                    )
                  ],
                ),
                subtitle: Text(
                  "General Manager, One & Only Hotel",
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                ),
                trailing: WorkExperienceDropdown(
                  onTappedInside: () {
                    setState(() {
                      showSubMenu = !showSubMenu;
                    });
                  },
                  onTappedOutside: () {
                    setState(() {
                      showSubMenu = false;
                    });
                  },
                ),
              ),
              Di.SBHES,
              Container(
                height: Di.FSOTL + 10,
                padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                child: Row(
                  children: [
                    Container(
                      width: Di.FSOTL,
                      height: Di.FSOTL,
                      decoration: Styles.boxDecoration.copyWith(
                        color: Cr.accentBlue1,
                      ),
                      child: Icon(
                        Icons.format_quote,
                        color: Cr.whiteColor,
                        size: 18,
                      ),
                    ),
                    Di.SBWD,
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: Text(
                          getDescription(context).first,
                          style: bodyLarge.copyWith(
                            color: Cr.darkGrey1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Di.SBHETS,
              widget.displayShowMoreHideButton
                  ? AnimatedCrossFade(
                      firstChild: _ShowMoreWIdget(
                        getDescription: getDescription,
                        showMore: false,
                      ),
                      secondChild: _ShowMoreWIdget(
                        getDescription: getDescription,
                        showMore: true,
                      ),
                      crossFadeState: showMore
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 300),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                      child: Text(
                        getDescription(context).last,
                        style: bodyLarge.copyWith(
                          color: Cr.darkGrey1,
                        ),
                      ),
                    ),
              if (widget.displayShowMoreHideButton)
                CustomTextButton(
                  onPressed: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  textWidget: AnimatedCrossFade(
                    secondChild: Text(
                      "  + Show more",
                      style: (bodySmallRegular).copyWith(
                        color: Cr.accentBlue1,
                      ),
                    ),
                    firstChild: Text(
                      "  - Show less",
                      style: (bodySmallRegular).copyWith(
                        color: Cr.accentBlue1,
                      ),
                    ),
                    crossFadeState: showMore
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 200),
                  ),
                ),
              Di.SBHD,
            ],
            // ExpansionTile(
            //   leading: PersonAvatar(
            //     avatarSize: Di.FSOTL + 10,
            //   ),
            //   title: Row(
            //     children: [
            //       Text(
            //         "Sarah Lee",
            //         style: h4Bold,
            //       ),
            //       Di.SBWES,
            //       Text(
            //         "MHL",
            //         style: dividerTextSmall,
            //       )
            //     ],
            //   ),
            //   subtitle: Text(
            //     "General Manager, One & Only Hotel",
            //     style: bodySmallRegular.copyWith(
            //       color: Cr.darkGrey1,
            //     ),
            //   ),
            //   trailing: Icon(
            //     Icons.keyboard_arrow_down,
            //     color: Cr.darkGrey1,
            //     size: 18,
            //   ),
            //   children: <Widget>[
            //     Di.SBHES,
            //     Container(
            //       height: Di.FSOTL + 10,
            //       padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
            //       child: Row(
            //         children: [
            //           Container(
            //             width: Di.FSOTL,
            //             height: Di.FSOTL,
            //             decoration: Styles.boxDecoration.copyWith(
            //               color: Cr.accentBlue1,
            //             ),
            //             child: Icon(
            //               Icons.format_quote,
            //               color: Cr.whiteColor,
            //               size: 18,
            //             ),
            //           ),
            //           Di.SBWD,
            //           Expanded(
            //             child: SizedBox(
            //               height: 44,
            //               child: Text(
            //                 getDescription(context).first,
            //                 style: bodyLarge.copyWith(
            //                   color: Cr.darkGrey1,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Di.SBHETS,
            //     widget.displayShowMoreHideButton
            //         ? AnimatedCrossFade(
            //             firstChild: _ShowMoreWIdget(
            //               getDescription: getDescription,
            //               showMore: false,
            //             ),
            //             secondChild: _ShowMoreWIdget(
            //               getDescription: getDescription,
            //               showMore: true,
            //             ),
            //             crossFadeState: showMore
            //                 ? CrossFadeState.showFirst
            //                 : CrossFadeState.showSecond,
            //             duration: Duration(milliseconds: 300),
            //           )
            //         : Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
            //             child: Text(
            //               getDescription(context).last,
            //               style: bodyLarge.copyWith(
            //                 color: Cr.darkGrey1,
            //               ),
            //             ),
            //           ),
            //     if (widget.displayShowMoreHideButton)
            //       CustomTextButton(
            //         onPressed: () {
            //           setState(() {
            //             showMore = !showMore;
            //           });
            //         },
            //         textWidget: AnimatedCrossFade(
            //           secondChild: Text(
            //             "  + Show more",
            //             style: (bodySmallRegular).copyWith(
            //               color: Cr.accentBlue1,
            //             ),
            //           ),
            //           firstChild: Text(
            //             "  - Show less",
            //             style: (bodySmallRegular).copyWith(
            //               color: Cr.accentBlue1,
            //             ),
            //           ),
            //           crossFadeState: showMore
            //               ? CrossFadeState.showFirst
            //               : CrossFadeState.showSecond,
            //           duration: Duration(milliseconds: 200),
            //         ),
            //       ),
            //     Di.SBHD,
            //   ],
            // ),
          ),
        ),
        if (showSubMenu)
          Positioned(
            right: 17,
            top: 40,
            child: CustomSubMenu(
              customSubMenuItems: [
                CustomSubmenuItem(
                  icon: SvgPicture.asset(
                    Svgs.eyeOff,
                    width: 16,
                    color: Cr.darkGrey1,
                  ),
                  text: "Hide from my profile",
                ),
                CustomSubmenuItem(
                  iconData: Icons.delete,
                  text: "Delete",
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// This dropdown is using tap_canvas libaray,
/// to make it working wrape the
/// whole screen(The area in which you want it to dimeiss after clicking there)
///  with `TapCanvas`
class WorkExperienceDropdown extends StatelessWidget {
  const WorkExperienceDropdown({
    Key? key,
    required this.onTappedOutside,
    required this.onTappedInside,
  }) : super(key: key);
  final void Function() onTappedOutside;
  final void Function() onTappedInside;

  @override
  Widget build(BuildContext context) {
    return TapOutsideDetectorWidget(
      onTappedOutside: onTappedOutside,
      onTappedInside: onTappedInside,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Cr.whiteColor,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: 1,
            color: Cr.grey2,
          ),
        ),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: Cr.darkGrey1,
          size: 18,
        ),
      ),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  DemoPageState createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  final _focusNode = FocusNode();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print('FOCUS GAINED');
      } else {
        print('FOCUS LOST');
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TapCanvas(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: Center(
                  child: TapOutsideDetectorWidget(
                    onTappedOutside: () {
                      print('OUTSIDE TAPPED');
                      _focusNode.unfocus();
                    },
                    onTappedInside: () {
                      print('INSIDE TAPPED');
                      _focusNode.requestFocus();
                    },
                    child: Container(
                      height: 60,
                      width: 400,
                      color: Colors.green[200],
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: 20,
                              color: Colors.blue[100],
                              child: TextField(
                                focusNode: _focusNode,
                                controller: _textController,
                                textAlignVertical: TextAlignVertical.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class CustomSubMenu extends StatelessWidget {
  const CustomSubMenu({
    Key? key,
    required this.customSubMenuItems,
  }) : super(key: key);
  final List<CustomSubmenuItem> customSubMenuItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: Di.PSS),
          child: SvgPicture.asset(
            Svgs.menuAboveArrow,
          ),
        ),
        ...customSubMenuItems,
      ],
    );
  }
}

class CustomSubmenuItem extends StatelessWidget {
  const CustomSubmenuItem({
    Key? key,
    required this.text,
    this.iconData,
    this.icon,
    this.textIconColor,
    this.textStyle,
    this.width,
    this.onTap,
  }) : super(key: key);
  final String text;
  final IconData? iconData;
  final Widget? icon;
  final Color? textIconColor;
  final TextStyle? textStyle;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return OnHover(builder: (bool isHovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          color: isHovered ? Cr.accentBlue3 : Cr.whiteColor,
          width: width ?? 180,
          height: 38,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Di.PSS,
            ),
            child: Row(
              children: [
                icon ??
                    (iconData != null
                        ? Icon(
                            iconData,
                            color: textIconColor ?? Cr.darkGrey1,
                            size: 14,
                          )
                        : Di.ESB),
                Di.SBCW(6.5),
                Text(
                  text,
                  style: textStyle ??
                      bodySmallSemibold.copyWith(
                        color: textIconColor ?? Cr.darkGrey1,
                      ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _ShowMoreWIdget extends StatelessWidget {
  const _ShowMoreWIdget({
    Key? key,
    required this.getDescription,
    this.showMore = false,
  }) : super(key: key);

  final List<String> Function(BuildContext context) getDescription;
  final bool showMore;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
      child: Text(
        getDescription(context).last,
        maxLines: showMore ? null : 2,
        overflow: TextOverflow.fade,
        style: bodyLarge.copyWith(
          color: Cr.darkGrey1,
        ),
      ),
    );
  }
}
