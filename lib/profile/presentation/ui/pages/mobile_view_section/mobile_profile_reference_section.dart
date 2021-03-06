import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/profile_reference_single_compoenet.dart';
import 'package:holedo/profile/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/timeline_component.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:provider/provider.dart';

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
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Di.PSS,
      ),
      child: Column(
        children: [
          if (isTablt) Di.SBHS,
          if (isMobilePhn && profileProvider.isMyProfile) ...[
            const ProfileCompletionComponent(),
            Di.SBHS,
          ],
          const ProfileReferenceSingleComponent(
            isMobile: true,
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
          ),
          const ProfileReferenceSingleComponent(
            isMobile: true,
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
          ),
          const ProfileReferenceSingleComponent(
            isMobile: true,
          ),
          const ProfileReferenceSingleComponent(
            isMobile: true,
          ),
          if (isTablt) ...[
            const ProfileCompletionComponent(),
            Di.SBHS,
          ],
          const ConnectionsComponent(
            isMobile: true,
          ),
          Di.SBHS,
          const TimelineComponent(),
          Di.SBHS,
          const RightsComponent(
            isMobile: true,
          ),
          Di.SBHOTL,
        ],
      ),
    );
  }
}
