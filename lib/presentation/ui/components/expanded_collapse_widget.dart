import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/expanded_section.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ExpandedCollapseWidget extends StatefulWidget {
  const ExpandedCollapseWidget({
    Key? key,
    required this.description,
    this.isTablet = false,
    this.isMobile = false,
    this.showText,
    this.hideText,
  }) : super(key: key);

  final String description;
  final bool isTablet;
  final bool isMobile;
  final String? showText;
  final String? hideText;

  @override
  State<ExpandedCollapseWidget> createState() => ExpandedCollapseWidgetState();
}

class ExpandedCollapseWidgetState extends State<ExpandedCollapseWidget> {
  bool showMore = false;
  bool expandeWidget = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: expandeWidget ? null : 40,
      width: double.infinity,
      color: Cr.lightGrey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandedSection(
            expand: showMore,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: Di.PSD,
                right: Di.PSD,
              ),
              child: Text(
                widget.description,
                // "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: bodyLarge.copyWith(
                  color: Cr.darkGrey1,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: Cr.lightGrey2,
            padding: const EdgeInsets.only(left: Di.PSL),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AnimatedCrossFade(
                firstChild: GestureDetector(
                  onTap: () async {
                    // final oldShowMore = showMore;
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Svgs.plus,
                        color: Cr.accentBlue1,
                        width: 12,
                      ),
                      Di.SBCW(6),
                      Text(
                        widget.showText ?? "Show more",
                        style: (bodySmallRegular).copyWith(
                          color: Cr.accentBlue1,
                        ),
                      )
                    ],
                  ),
                ),
                secondChild: GestureDetector(
                  onTap: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Svgs.minus,
                        color: Cr.accentBlue1,
                        width: 12,
                      ),
                      Di.SBCW(6),
                      Text(
                        widget.hideText ?? "Close",
                        style: (bodySmallRegular).copyWith(
                          color: Cr.accentBlue1,
                        ),
                      )
                    ],
                  ),
                ),
                crossFadeState: showMore
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
            ),
          ),

          // Di.SBHS,
        ],
      ),
    );
  }
}
