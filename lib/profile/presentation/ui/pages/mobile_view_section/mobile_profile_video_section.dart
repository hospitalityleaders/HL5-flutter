import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/profile/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';

class MobileProfileVideoSection extends ConsumerWidget {
  const MobileProfileVideoSection({
    Key? key,
    required this.isMobilePhn,
    required this.isTablt,
  }) : super(key: key);

  final bool isMobilePhn;
  final bool isTablt;

  @override
  Widget build(BuildContext context, ref) {
    final userProfileData = ref.watch(profileNotifierProvider).userProfileData!;
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
