import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/profile_overview_first_column.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';

class PageOverviewSection extends StatefulWidget {
  const PageOverviewSection({
    Key? key,
  }) : super(key: key);

  @override
  State<PageOverviewSection> createState() => _PageOverviewSectionState();
}

class _PageOverviewSectionState extends State<PageOverviewSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ProfileOverviewFirstColumn(),
          ),
          Di.SBWEL,
          Flexible(
            child: ProfileOverviewSecondColumn(),
          ),
          Di.SBWEL,
          Flexible(
            child: ProfileOverviewThirdColumn(),
          ),
          Di.SBWEL,
        ],
      ),
    );
  }
}
