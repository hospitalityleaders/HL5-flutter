import 'package:flutter/material.dart';

import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/responsive.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class CompanyJobsTabbar extends StatelessWidget {
  const CompanyJobsTabbar({
    Key? key,
    required this.tabController,
    this.onTap,
  }) : super(key: key);

  final TabController tabController;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    final bool isTab = isTablet(context);

    final EdgeInsets tabPadding = isTab
        ? const EdgeInsets.symmetric(vertical: 10)
        : const EdgeInsets.all(10);
    final double fontSize = isTab ? 12.5 : 14;

    return Container(
      width: Di.getScreenSize(context).width,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 70),
      decoration: BoxDecoration(
        color: Cr.whiteColor,
        boxShadow: defaultBoxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Cr.accentBlue1,
                ),
              ),
              Di.SBCW(8),
              Text(
                "Twenty Five Hours Hotels",
                style: h4Bold.copyWith(),
              ),
            ],
          ),
          TabBar(
            onTap: onTap,
            labelColor: Cr.accentBlue1,
            unselectedLabelColor: Cr.darkGrey2,
            indicatorColor: Cr.accentBlue1,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            isScrollable: true,
            tabs: [
              Padding(
                padding: tabPadding,
                child: Text(
                  'Job Vacancies',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SourceSansPro',
                    fontSize: fontSize,
                  ),
                ),
              ),
              Padding(
                padding: tabPadding,
                child: Text(
                  'Media',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SourceSansPro',
                    fontSize: fontSize,
                  ),
                ),
              ),
            ],
          ),
          Di.SBCW(100),
        ],
      ),
    );
  }
}
