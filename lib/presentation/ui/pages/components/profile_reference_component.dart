import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/received_reference.dart';
import 'package:holedo/presentation/ui/components/custom_text_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/components/view_timeline_edit_profile_submenu.dart';
import 'package:holedo/presentation/ui/pages/components/edit_add_buttons_of_sheet.dart';
import 'package:holedo/presentation/ui/pages/components/edit_blue_card_sheet.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_my_reference_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileReferenceComponent extends StatefulWidget {
  const ProfileReferenceComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  State<ProfileReferenceComponent> createState() =>
      _ProfileReferenceComponentState();
}

class _ProfileReferenceComponentState extends State<ProfileReferenceComponent> {
  bool showSubMenu = false;

  @override
  Widget build(BuildContext context) {
    final List<ReceivedReference>? receivedReferences =
        DbData.getUserProfileData.receivedReferences;
    return DecoratedBox(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Di.SBHETS,
              ProfileComponentTitle(
                isMobile: widget.isMobile,
                onIconPressed: () {
                  setState(() {
                    showSubMenu = !showSubMenu;
                  });
                },
                title: "References",
              ),
              Di.DWZH,
              IntrinsicHeight(
                child: Stack(
                  children: [
                    if (receivedReferences != null
                        ? receivedReferences.isNotEmpty
                        : false)
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: receivedReferences
                              .map(
                                (value) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Di.PSS,
                                  ),
                                  decoration: Styles.boxDecoration
                                      .copyWith(color: Cr.whiteColor),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: const PersonAvatar(
                                          avatarSize: Di.FSOTL + 10,
                                        ),
                                        title: Row(
                                          children: const [
                                            Text(
                                              "Name ",
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
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: Di.PSD,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Di.FSOTL,
                                              height: Di.FSOTL,
                                              decoration:
                                                  Styles.boxDecoration.copyWith(
                                                color: Cr.accentBlue1,
                                              ),
                                              child: const Icon(
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
                                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit 213",
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
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: Di.PSD,
                                        ),
                                        child: Text(
                                          "incididunt ut labore et dolore magna aliqua.",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: bodyLarge.copyWith(
                                            color: Cr.darkGrey1,
                                          ),
                                        ),
                                      ),
                                      const CustomTextButton(
                                        text: "  + Show more",
                                      ),
                                      Di.SBHD,
                                      const Divider(thickness: 1),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    EditBlueCardSheet(
                      context,
                      dataIsNull: receivedReferences == null,
                      greenCardText:
                          "You currently have no references to display on your profile. As soon as you receive a reference it will display here. Request a reference from a connection",
                    ),
                    if (receivedReferences != null)
                      EditAddButtonOfSheet(
                        context,
                        onEditPressed: () {
                          // buildReferencesCard(img, title, userId, subTitle, description)
                          showCustomDialog(
                            context,
                            ProfileMyReferenceDialogWidget(
                              userProfileData: DbData.getUserProfileData,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (showSubMenu)
            Positioned(
              right: 8,
              top: 41,
              child: ViewTimeEditProfileSubmenu(
                donotShowTimeline: true,
                hideSubMenuCallback: () {
                  setState(() {
                    showSubMenu = false;
                  });
                },
                editText: 'references',
              ),
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
      padding: const EdgeInsets.symmetric(horizontal: Di.PSS),
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const PersonAvatar(
              avatarSize: Di.FSOTL + 10,
            ),
            title: Row(
              children: const [
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
                  child: const Icon(
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
          const CustomTextButton(
            text: "  + Show more",
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}
