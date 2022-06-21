import 'package:flutter/material.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/components/custom_text_button.dart';
import 'package:holedo/components/edit_icon_buttton.dart';
import 'package:holedo/components/person_avatar.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

class ProfileReferenceComponent extends StatelessWidget {
  const ProfileReferenceComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Di.SBHETS,
          Card(
            child: ListTile(
              title: Text(
                "References",
                style: h2Regular,
              ),
            ),
          ),
          // Divider(thickness: 1),
          Stack(
            children: [
              Column(
                children: [
                  _ProfileReferenceListTile(),
                  Divider(thickness: 1),
                  _ProfileReferenceListTile(),
                  Divider(thickness: 1),
                ],
              ),
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Container(
                            width: 560,
                            height: 370,
                            color: Cr.accentBlue2.withOpacity(.8),
                            padding: EdgeInsets.all(Di.PSD),
                          ),
                        ],
                      ),
                    )
                  : Di.ESB,
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? EditIconButton(onPressed: () {})
                  : Di.ESB,
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileReferenceListTile extends StatelessWidget {
  const _ProfileReferenceListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: EdgeInsets.symmetric(horizontal: Di.PSS),
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: PersonAvatar(
              avatarSize: Di.FSOTL + 10,
            ),
            title: Row(
              children: [
                Text(
                  "Sarah Lee",
                  style: h4Bold,
                ),
                Di.SBWES,
                Text(
                  "MHL",
                  style: dividerTextSmall,
                )
              ],
            ),
            subtitle: Text(
              "General Manager, One & Only Hotel",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ),
          Di.SBHES,
          Container(
            height: Di.FSOTL + 10,
            padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
            child: Row(
              children: [
                Container(
                  width: Di.FSOTL,
                  height: Di.FSOTL,
                  decoration: Styles.boxDecoration.copyWith(
                    color: Cr.accentBlue1,
                  ),
                  child: Icon(
                    Icons.format_quote,
                    color: Cr.whiteColor,
                  ),
                ),
                Di.SBWD,
                Expanded(
                  // width: 100,
                  child: SizedBox(
                    height: Di.FSOTL + 6,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                      style: bodyLarge.copyWith(
                        color: Cr.darkGrey1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Di.SBHETS,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
            child: Text(
              "incididunt ut labore et dolore magna aliqua.",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: bodyLarge.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ),
          CustomTextButton(
            text: "  + Show more",
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}
