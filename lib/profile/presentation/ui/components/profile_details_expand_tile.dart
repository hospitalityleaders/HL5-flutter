import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/data/presentation_data.dart';
import 'package:holedo/profile/presentation/functions/helper_functions.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/images.dart';
import 'package:holedo/profile/presentation/utill/nav.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class ProfileDetailsExpandedTile extends ConsumerStatefulWidget {
  final bool isExpanded;
  const ProfileDetailsExpandedTile({
    Key? key,
    this.isExpanded = false,
    required this.userProfileData,
  }) : super(key: key);
  final User userProfileData;

  @override
  ConsumerState<ProfileDetailsExpandedTile> createState() =>
      _ProfileDetailsExpandedTileState();
}

class _ProfileDetailsExpandedTileState
    extends ConsumerState<ProfileDetailsExpandedTile> {
  String? selectedValue;
  bool currentlyWorkHere = false;

  late ExpandedTileController expandedTileController;
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _professionalTitleController;
  late final TextEditingController _cityAreaController;
  int? countryId;

  @override
  void initState() {
    _nameController =
        TextEditingController(text: widget.userProfileData.firstName ?? "");
    _surnameController =
        TextEditingController(text: widget.userProfileData.lastName ?? "");
    _professionalTitleController = TextEditingController(
      text: widget.userProfileData.professionalTitle ?? "",
    );
    _cityAreaController =
        TextEditingController(text: widget.userProfileData.area ?? "");
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    countryId = widget.userProfileData.countryId;
    super.initState();
  }

  @override
  void dispose() {
    expandedTileController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _professionalTitleController.dispose();
    _cityAreaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileData = ref.watch(profileNotifierProvider).userProfileData!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 645,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile details',
              style: h4Bold,
            ),
            Text(
              "Your name, surname, professional title and location.",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            expandedTileController = expandedTileController.copyWith(
              isExpanded: !expandedTileController.isExpanded,
            );
          });
        },
        leading: Container(
          width: 50,
          height: 50,
          color: Cr.accentBlue1,
          child: const Center(
            child: Icon(
              Icons.camera_alt,
              size: 22,
              color: Cr.whiteColor,
            ),
          ),
        ),
        trailingRotation: 0,
        trailing: !(expandedTileController.isExpanded == false)
            ? null
            : const CustomMinusIcon(),
        theme: const ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
          color: Cr.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DialogLabelTextFormField(customLabel: "Name"),
                  Di.SBHES,
                  DialogTextFieldForm(
                    textEditingController: _nameController,
                  ),
                  Di.SBCH(18),
                  const DialogLabelTextFormField(customLabel: "Surname"),
                  Di.SBHES,
                  DialogTextFieldForm(
                    textEditingController: _surnameController,
                  ),
                  Di.SBCH(18),
                  DialogLabelTextFormField(
                    customLabel: "Professional title",
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                          Svgs.helpCircle,
                          color: Cr.accentBlue1,
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "This is a short and clear sentence which describes what you do. \nE.g. General Manager and Hotel Executive, or Head Chef and Book Author.",
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  ),
                  Di.SBHES,
                  DialogTextFieldForm(
                    textEditingController: _professionalTitleController,
                  ),
                  Di.SBCH(18),
                  Row(
                    children: const [
                      DialogLabelTextFormField(
                        customLabel: "City / Area  / Region",
                        width: 250,
                      ),
                      SizedBox(width: 18),
                      DialogLabelTextFormField(
                        customLabel: "Country",
                        width: 250,
                      ),
                    ],
                  ),
                  Di.SBHES,
                  Row(
                    children: [
                      DialogTextFieldForm(
                        textEditingController: _cityAreaController,
                        width: 250,
                      ),
                      const SizedBox(width: 18),
                      DialogDropDownTextField(
                        initialValue: countries[countryId.toString()],
                        onChanged: (value) {
                          if (value != null) {
                            final countryidString =
                                HelperFunctions.findKeyByValueFromMap(
                              countries,
                              value,
                            );

                            if (countryidString != null) {
                              setState(() {
                                countryId = int.tryParse(countryidString);
                              });
                            }
                          }
                        },
                        alignHintTextStart: true,
                        hintText: 'Select Country',
                        dataList: countries.values.toList(),
                      ),
                    ],
                  ),
                ],
              ),
              Di.SBCH(28),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () => Nav.pop(context),
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue3,
                        child: Text(
                          "Cancel",
                          style: bodySmallRegular.copyWith(
                            color: Cr.accentBlue1,
                          ),
                        ),
                      ),
                      Di.SBWES,
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        onPressed: () async {
                          showCircularProgressIndicator(context);
                          await User(
                            firstName: _nameController.text,
                            professionalTitle:
                                _professionalTitleController.text,
                            lastName: _surnameController.text,
                            area: _cityAreaController.text,
                            countryId: countryId,
                          ).save(userProfileData);
                          ref
                              .read(profileNotifierProvider.notifier)
                              .changeAppNotificationState(
                                const AppNotificationState.sucess(),
                              );
                          Nav.profile(context);
                          Nav.pop(context);
                          Nav.pop(context);
                        },
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue1,
                        child: Text(
                          "Save",
                          style: bodySmallRegular.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Di.SBHL,
            ],
          ),
        ),
      ),
    );
  }
}
