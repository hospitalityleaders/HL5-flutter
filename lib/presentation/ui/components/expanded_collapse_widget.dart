import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/expanded_section.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
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
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: Di.PSD,
                right: Di.PSD,
              ),
              child: Text(
                // singleEducation
                //         .description ??
                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: bodyLarge.copyWith(
                  color: Cr.darkGrey1,
                ),
              ),
            ),
            expand: showMore,
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: Cr.lightGrey2,
            padding: EdgeInsets.only(left: Di.PSL),
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
                  child: Text(
                    widget.showText ?? r"  + Show more",
                    style: (bodySmallRegular).copyWith(
                      color: Cr.accentBlue1,
                    ),
                  ),
                ),
                secondChild: GestureDetector(
                  onTap: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  child: Text(
                    widget.hideText ?? r"  - Close",
                    style: (bodySmallRegular).copyWith(
                      color: Cr.accentBlue1,
                    ),
                  ),
                ),
                crossFadeState: showMore
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 200),
              ),
            ),
          ),

          // Di.SBHS,
        ],
      ),
    );
  }
}
