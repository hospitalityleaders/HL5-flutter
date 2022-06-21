import 'package:flutter/material.dart';
import 'package:holedo/components/person_avatar.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Cr.whiteColor,
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Cr.darkGrey1,
          ),
        ),
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
        ],
      ),
    );
  }
}
