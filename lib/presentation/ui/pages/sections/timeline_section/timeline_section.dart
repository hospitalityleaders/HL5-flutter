import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/presentation/utill/styles.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Di.getScreenSize(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHOTL,
          SizedBox(
            width: 550,
            // height: 220,
            child: Column(
              children: [
                TimeLineWidget(
                  jobDescriptionInHtml:
                      "<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
                ),
                TimeLineWidget(),
                TimeLineWidget(
                  jobDescriptionInHtml: """<div>
                                 
                                  <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                  <h4>Course outline</h4>
                                  <ul>
                                    <li>Macro Economics</li>
                                    <li>International Monetary Economics</li>
                                    <li>Advanced Time Series Econometrics</li>
                                    <li>Extended Essay in Money and Banking</li>
                                  </ul>
                                  <!--You can pretty much put any html in here!-->
                                </div>""",
                ),
                TimeLineWidget(
                  jobDescriptionInHtml:
                      "<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
                  showComments: true,
                ),
              ],
            ),
          ),
          Di.SBWEL,
          SizedBox(
            width: 360,
            child: Column(
              children: [
                ProfileCompletionComponent(),
                Di.SBHEL,
                ConnectionsComponent(),
                ProfileAdsComponent(),
                RightsComponent(),
              ],
            ),
          ),
          Di.SBWEL,
        ],
      ),
    );
  }
}

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget(
      {Key? key, this.jobDescriptionInHtml, this.showComments = false})
      : super(key: key);
  final bool showComments;
  final String? jobDescriptionInHtml;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Di.PSS),
      child: Column(
        children: [
          Container(
            height: 96,
            color: Cr.whiteColor,
            padding: EdgeInsets.symmetric(
              horizontal: Di.PSL,
              vertical: Di.PSD,
            ),
            child: Row(
              children: [
                ContainerWithIcon(
                  size: 50,
                  iconData: FontAwesomeIcons.buildingColumns,
                ),
                Di.SBWD,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Food and Beverage Manager",
                      style: h4Bold.copyWith(
                        color: Cr.darkBlue1,
                      ),
                    ),
                    Text(
                      "Marriott Hotels · Cape Town",
                      style: bodySmallRegular.copyWith(
                        color: Cr.accentBlue1,
                      ),
                    ),
                    Text(
                      "February 2013 – present (1 year 6 months)",
                      style: bodySmallRegular.copyWith(
                        color: Cr.darkGrey1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          jobDescriptionInHtml != null
              ? Container(
                  // height: 123,
                  width: 550,
                  color: Cr.lightGrey2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 518,
                        // height: 66,
                        child: Html(
                          data: jobDescriptionInHtml,
                          style: {
                            "h4": Style(
                              color: Cr.darkGrey1,
                            ),
                            "p": Style(
                              color: Cr.darkGrey1,
                              backgroundColor: Cr.lightGrey2,
                            ),
                            "li": Style(
                              color: Cr.darkGrey1,
                              backgroundColor: Cr.lightGrey2,
                            ),
                          },
                        ),
                        // child: Text(
                        //   jobDescriptionInHtml!,
                        //   style: bodyLarge.copyWith(
                        //     color: Cr.darkGrey1,
                        //   ),
                        // ),
                      ),
                      Di.SBHES,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextButton(
                          text: "  - Close",
                        ),
                      ),
                      SizedBox(
                        height: Di.PSS,
                      ),
                    ],
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 40,
                  color: Cr.lightGrey2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Di.PSL,
                      vertical: Di.PSS,
                    ),
                    child: Text(
                      "  + Job Description",
                      style: bodySmallRegular.copyWith(
                        color: Cr.accentBlue1,
                      ),
                    ),
                  ),
                ),
          showComments
              ? Container(
                  height: 120,
                  color: Cr.whiteColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: Di.PSL,
                    vertical: Di.PSS,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 12,
                                color: Cr.accentBlue1,
                              ),
                              Di.SBWES,
                              Text(
                                "Like",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              Di.SBWES,
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  color: Cr.accentBlue3,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Center(
                                    child: Text(
                                      "12",
                                      style: dividerTextSmall.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Di.SBWOL,
                          Row(
                            children: [
                              Icon(
                                Icons.comment,
                                size: 12,
                                color: Cr.accentBlue1,
                              ),
                              Di.SBWES,
                              Text(
                                "Comment",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              Di.SBWES,
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  color: Cr.accentBlue3,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Center(
                                    child: Text(
                                      "12",
                                      style: dividerTextSmall.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Di.SBWOL,
                          Row(
                            children: [
                              Icon(
                                Icons.share,
                                size: 12,
                                color: Cr.accentBlue1,
                              ),
                              Di.SBWES,
                              Text(
                                "Share",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              Di.SBWES,
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  color: Cr.accentBlue3,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Center(
                                    child: Text(
                                      "12",
                                      style: dividerTextSmall.copyWith(
                                        color: Cr.accentBlue1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Di.PSL),
                        child: Row(
                          children: [
                            PersonAvatar(
                              avatarSize: 40,
                            ),
                            Di.SBWL,
                            SizedBox(
                              width: 360,
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Leave a comment",
                                  hintStyle: bodySmallRegular.copyWith(
                                    color: Cr.darkGrey1,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Cr.darkGrey4,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Cr.darkGrey4,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Cr.darkGrey4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
