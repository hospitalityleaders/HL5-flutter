import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class MobileProfileVideoSection extends StatelessWidget {
  const MobileProfileVideoSection({
    Key? key,
    required this.isMobilePhn,
    required this.isTablt,
  }) : super(key: key);

  final bool isMobilePhn;
  final bool isTablt;

  @override
  Widget build(BuildContext context) {
    final userProfileData = DbData.getUserProfileData;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Di.PSS,
      ),
      child: Column(
        children: [
          FeaturedVideoComponent(
            isMobile: true,
            userProfileData: userProfileData,
          ),
          Di.SBHOTL,
        ],
      ),
    );
  }
}
