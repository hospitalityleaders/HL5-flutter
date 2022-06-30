import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/ui/components/profile_reference_single_compoenet.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class MobileProfileReferenceSection extends StatelessWidget {
  const MobileProfileReferenceSection({
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
          if (isMobilePhn)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
              child: ProfileCompletionComponent(),
            ),
          Di.SBHD,
          ProfileReferenceSingleComponent(
            isMobile: true,
          ),
          Di.SBHD,
          ProfileReferenceSingleComponent(
            isMobile: true,
          ),
          Di.SBHD,
          ProfileReferenceSingleComponent(
            isMobile: true,
          ),
          Di.SBHD,
          if (isTablt) ProfileCompletionComponent(),
          Di.SBHD,
          ConnectionsComponent(
            isMobile: true,
          ),
          TimelineComponent(),
          RightsComponent(
            isMobile: true,
          ),
          Di.SBHOTL,
        ],
      ),
    );
  }
}
