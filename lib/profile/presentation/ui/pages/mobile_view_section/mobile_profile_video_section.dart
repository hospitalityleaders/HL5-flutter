import 'package:flutter/material.dart';

import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:provider/provider.dart';

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
    final userProfileData =
        Provider.of<ProfileProvider>(context).userProfileData!;
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
