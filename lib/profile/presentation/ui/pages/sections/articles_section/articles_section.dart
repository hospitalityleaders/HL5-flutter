import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_article_timeline_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({
    Key? key,
    this.showIsMemberOnly = true,
  }) : super(key: key);

  final bool showIsMemberOnly;

  @override
  Widget build(BuildContext context) {
    // final articles = ref.watch(profileNotifierProvider).userProfileData!.articles;
    return SizedBox(
      width: Di.getScreenSize(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHOTL,
          Flexible(
            child: SizedBox(
              width: 360,
              // height: 220,
              child: Column(
                children: const [
                  ProfileArticleWidget(),
                  ProfileArticleWidget(),
                  ProfileArticleWidget(),
                  ProfileArticleWidget(),
                ],
              ),
            ),
          ),
          Di.SBWEL,
          Flexible(
            child: SizedBox(
              width: 360,
              // height: 220,
              child: Column(
                children: const [
                  ProfileArticleWidget(),
                  ProfileArticleWidget(),
                  ProfileArticleWidget(),
                  ProfileArticleWidget(),
                ],
              ),
            ),
          ),
          Di.SBWEL,
          Flexible(
            child: SizedBox(
              width: 365,
              child: Column(
                children: const [
                  ProfileArticleTimelineComponent(),
                  Di.SBHEL,
                  ProfileArticleWidget(
                    showIsMemberOnly: true,
                  ),
                  ProfileArticleWidget(),
                  Di.SBHEL,
                  ConnectionsComponent(),
                  ProfileAdsComponent(),
                  RightsComponent(),
                ],
              ),
            ),
          ),
          Di.SBWEL,
        ],
      ),
    );
  }
}

class ProfileArticleWidget extends StatelessWidget {
  const ProfileArticleWidget({
    Key? key,
    this.showIsMemberOnly = false,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;
  final bool showIsMemberOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? null : 360,
      height: showIsMemberOnly ? 332 : 305,
      color: Cr.whiteColor,
      margin: const EdgeInsets.symmetric(vertical: Di.PSS),
      child: Padding(
        padding: const EdgeInsets.all(Di.PSD),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 175,
              child: Image.asset(
                "assets/images/public.png",
                fit: BoxFit.cover,
              ),
            ),
            Di.SBHD,
            const Text(
              "Baha Mar Files Chapter 11 Plan of Reorganization",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: h3Bold,
            ),
            Di.SBHES,
            Text(
              "By: Pam Carrol   •   26 August 2015   •   10:40",
              style: bodySmallSemibold.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
            Di.SBHS,
            if (showIsMemberOnly)
              SizedBox(
                width: 90,
                height: 20,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Cr.red3,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Center(
                      child: Text(
                        "MEMBERS ONLY",
                        textAlign: TextAlign.center,
                        style: bodyExtraSmall.copyWith(
                          color: Cr.red1,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            else
              Di.ESB,
          ],
        ),
      ),
    );
  }
}
