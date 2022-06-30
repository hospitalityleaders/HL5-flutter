import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileReferenceSingleComponent extends StatelessWidget {
  const ProfileReferenceSingleComponent({
    Key? key,
    this.description,
    this.isMobile = false,
  }) : super(key: key);

  final String? description;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? null : 360,
      padding: EdgeInsets.symmetric(
        horizontal: Di.PSS,
      ),
      margin: EdgeInsets.only(
        bottom: Di.PSL,
      ),
      decoration: Styles.boxDecorationWithShadow.copyWith(color: Cr.whiteColor),
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
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Cr.darkGrey1,
              size: 18,
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
                    size: 18,
                  ),
                ),
                Di.SBWD,
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      description ??
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
              description ?? "incididunt ut labore et dolore magna aliqua.",
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
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
