import 'package:flutter/material.dart';
import 'package:holedo/presentation/functions/helper_functions.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
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
      final List<String> descriptionList = HelperFunctions().splitText(
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
          padding: const EdgeInsets.symmetric(
            horizontal: Di.PSS,
          ),
          margin: const EdgeInsets.only(
            bottom: Di.PSL,
          ),
          decoration:
              Styles.boxDecorationWithShadow.copyWith(color: Cr.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const PersonAvatar(
                  avatarSize: Di.FSOTL + 10,
                ),
                title: Row(
                  children: const [
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
                trailing: CustomComponentDropdown(
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
                      child: const Icon(
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
              if (widget.displayShowMoreHideButton)
                AnimatedCrossFade(
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
                  duration: const Duration(milliseconds: 300),
                )
              else
                Padding(
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
                      style: bodySmallRegular.copyWith(
                        color: Cr.accentBlue1,
                      ),
                    ),
                    firstChild: Text(
                      "  - Show less",
                      style: bodySmallRegular.copyWith(
                        color: Cr.accentBlue1,
                      ),
                    ),
                    crossFadeState: showMore
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
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
          const Positioned(
            right: 17,
            top: 40,
            child: HideFromProfileDeleteRefereneceSubmenu(),
          ),
      ],
    );
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

/// This dropdown is using tap_canvas libaray,
/// to make it working wrape the
/// whole screen(The area in which you want it to dimeiss after clicking there)
///  with `TapCanvas`
class CustomComponentDropdown extends StatelessWidget {
  const CustomComponentDropdown({
    Key? key,
    required this.onTappedOutside,
    required this.onTappedInside,
    this.size,
    this.iconSize,
  }) : super(key: key);
  final void Function() onTappedOutside;
  final void Function() onTappedInside;
  final double? size;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return TapOutsideDetectorWidget(
      onTappedOutside: onTappedOutside,
      onTappedInside: onTappedInside,
      child: Container(
        width: size ?? 20,
        height: size ?? 20,
        decoration: BoxDecoration(
          color: Cr.whiteColor,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: Cr.grey2,
          ),
        ),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: Cr.darkGrey1,
          size: iconSize ?? 18,
        ),
      ),
    );
  }
}
