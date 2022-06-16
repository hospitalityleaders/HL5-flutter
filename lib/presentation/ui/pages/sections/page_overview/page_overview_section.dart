import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/profile_overview_first_column.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class PageOverviewSection extends StatelessWidget {
  const PageOverviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Di.getScreenSize(context).width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileOverviewFirstColumn(),
          Di.SBWEL,
          ProfileOverviewSecondColumn(),
          Di.SBWEL,
          ProfileOverviewThirdColumn(),
          Di.SBWEL,
        ],
      ),
    );
  }
}
