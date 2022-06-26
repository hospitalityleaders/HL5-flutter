import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

class ProfileTabbar extends StatelessWidget {
  const ProfileTabbar({
    Key? key,
    required this.tabController,
    this.onEditProfilePressed,
    this.isMine = false,
    this.onTap,
  }) : super(key: key);

  final TabController tabController;
  final void Function()? onEditProfilePressed;
  final bool isMine;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    final isEditable = Provider.of<ProfileProvider>(context).isProfileEditable;
    return Container(
      decoration: BoxDecoration(
        color: Cr.whiteColor,
        boxShadow: Styles.defaultBoxShadow,
      ),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PersonAvatar(),
              Di.SBWD,
              Text(
                "Noberto Holden",
                style: h4Bold,
                // de
              ),
              Di.SBWS,
              Text(
                "MHL",
                style: dividerTextSmall,
                // de
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                TabBar(
                  onTap: onTap,
                  labelColor: Cr.accentBlue1,
                  unselectedLabelColor: Cr.darkGrey2,
                  indicatorColor: Cr.accentBlue1,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  controller: tabController,
                  physics: NeverScrollableScrollPhysics(),
                  isScrollable: true,
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Profile overview',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SourceSansPro',
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Timeline',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Articles',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SourceSansPro',
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Activity',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SourceSansPro',
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'References',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SourceSansPro',
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          isMine
              ? CustomElevatedButton(
                  // onPressed: onEditProfilePressed,
                  text: Provider.of<ProfileProvider>(context).isProfileEditable
                      ? "Done Editing"
                      : null,
                  backgroundColor:
                      Provider.of<ProfileProvider>(context).isProfileEditable
                          ? Cr.green1
                          : null,
                  icon: Icon(
                    Icons.check,
                    size: Di.FSD,
                  ),
                  onPressed: () {
                    Provider.of<ProfileProvider>(context, listen: false)
                        .changeIsProfieEditableState(!isEditable);
                  },
                )
              : Di.ESB,
        ],
      ),
    );
  }
}
