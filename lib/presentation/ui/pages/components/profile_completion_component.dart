import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:flutter_svg/svg.dart';
import 'package:holedo/application/shared/providers.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class ProfileCompletionComponent extends ConsumerWidget {
  const ProfileCompletionComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileData = DbData.getUserProfileData;
    final bool experienceAdded = userProfileData.experiences != null ||
        userProfileData.experiences!.isNotEmpty;
    final bool qualificationAdded = (userProfileData.educations == null ||
            userProfileData.educations!.isNotEmpty) ||
        (userProfileData.educations!.first.qualification == null ||
            userProfileData.educations!.first.qualification != null);
    final bool expertiseAdded = userProfileData.expertise == null ||
        userProfileData.expertise!.isNotEmpty;
    final bool languagesAdded = userProfileData.languages == null ||
        userProfileData.languages!.isNotEmpty;
    final percentage =
        Provider.of<ProfileProvider>(context).percentageProfileCompleted;

    return Container(
      padding: const EdgeInsets.all(Di.PSD),
      decoration: Styles.boxDecoration.copyWith(color: Cr.darkBlue6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                percentage.toString(),
                style: display1.copyWith(
                  color: Cr.whiteColor,
                ),
              ),
              Di.SBWETS,
              Padding(
                padding: const EdgeInsets.only(top: Di.PSES),
                child: Text(
                  "%",
                  style: h2Regular.copyWith(
                    color: Cr.whiteColor,
                    fontSize: Di.FSOL,
                  ),
                ),
              ),
            ],
          ),
          Di.SBHD,
          LinearPercentIndicator(
            lineHeight: 10.0,
            alignment: MainAxisAlignment.center,
            percent: percentage / 100,
            backgroundColor: Colors.black,
            barRadius: const Radius.circular(20),
          ),
          Di.SBHD,
          SizedBox(
            width: double.infinity,
            child: Text(
              "Your profile is only $percentage% complete. ${percentage != 100 ? "Improve it now. Here's how." : ''} ",
              textAlign: TextAlign.center,
              style: h2Regular.copyWith(
                color: Cr.whiteColor,
              ),
            ),
          ),
          Di.SBHD,
          if (!experienceAdded) ...[
            const _ProfileCompletionText(
              title: 'Add your work experience',
            ),
            const _ProfileCompletionBorder(),
          ],
          if (!qualificationAdded) ...[
            const _ProfileCompletionText(
              title: 'Add your qualifications',
            ),
            const _ProfileCompletionBorder(),
          ],
          if (!expertiseAdded) ...[
            const _ProfileCompletionText(
              title: 'Add your specialities',
            ),
            const _ProfileCompletionBorder(),
          ],
          if (!languagesAdded) ...[
            const _ProfileCompletionText(
              title: 'Add your languages',
            ),
            const _ProfileCompletionBorder(),
          ],
          if (percentage != 100) ...[
            Di.SBHL,
            CustomElevatedButton(
              onPressed: () {
                ref
                    .read(profileNotifierProvider.notifier)
                    .changeIsProfieEditableState(true);
              },
              width: 320,
              text: "Edit my profile",
              donotShowIcon: true,
            ),
          ],
          Di.SBHS,
        ],
      ),
    );
  }
}

class _ProfileCompletionText extends StatelessWidget {
  const _ProfileCompletionText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Di.PSD,
        top: 13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Svgs.plusBox,
                width: 12,
                color: Cr.accentBlue1,
              ),
              Di.SBCW(6),
              Text(
                title,
                style: bodyLarge.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: TextWithBackground(
              padding: 4,
              paddingHorizantal: 5,
              backgroundColor: Cr.darkBlue5,
              text: "+20%",
              textStyle: dividerTextSmall.copyWith(
                color: Cr.accentBlue1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCompletionBorder extends StatelessWidget {
  const _ProfileCompletionBorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Cr.darkBlue5,
      padding: const EdgeInsets.symmetric(
        horizontal: Di.PSL,
      ),
    );
  }
}
