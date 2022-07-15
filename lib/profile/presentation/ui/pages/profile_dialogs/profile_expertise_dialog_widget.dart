import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/models/holedoapi/expertise.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/profile/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/nav.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:holedo/profile/presentation/validators/form_validator.dart';

class ProfileExpertiseDialogWidget extends ConsumerStatefulWidget {
  const ProfileExpertiseDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProfileExpertiseDialogWidget> createState() =>
      _ProfileExpertiseDialogWidgetState();
}

class _ProfileExpertiseDialogWidgetState
    extends ConsumerState<ProfileExpertiseDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  List<Expertise> get _getExpertise =>
      ref.watch(profileNotifierProvider).userProfileData!.expertise ?? [];

  @override
  Widget build(BuildContext context) {
    final List<Expertise> expertise = _getExpertise;
    return Container(
      color: Cr.darkGrey4,
      width: 655,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 46,
            decoration: BoxDecoration(
              color: Cr.whiteColor,
              boxShadow: defaultBoxShadow,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Expertise",
                      style: h2Regular,
                    ),
                    GestureDetector(
                      onTap: () => Nav.pop(context),
                      child: const Icon(
                        Icons.close,
                        size: 24,
                        color: Cr.accentBlue1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Cr.whiteColor,
            padding: const EdgeInsets.all(Di.PSL),
            margin: const EdgeInsets.all(Di.PSL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "What are your areas of expertise",
                      style: h5Bold,
                    ),
                    Di.SBWES,
                    Column(
                      children: const [
                        Icon(
                          Icons.help,
                          color: Cr.accentBlue1,
                          size: 12,
                        )
                      ],
                    ),
                  ],
                ),
                Di.SBHES,
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          validator: requiredValidator,
                          controller: _controller,
                          style: bodySmallRegular.copyWith(
                            color: Cr.darkGrey1,
                          ),
                          decoration: popUpDialogTextFieldInputDecoration,
                        ),
                      ),
                    ),
                    Di.SBWES,
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(
                            () {
                              expertise.add(
                                expertise[0].copyWith(
                                  id: 2342,
                                  title: _controller.text,
                                ),
                                // Expertise(
                                //   title: _controller.text.toString(),
                                // ),
                              );
                            },
                          );
                          _controller.clear();
                        }
                      },
                      borderColor: Cr.accentBlue2,
                      makeWidthNull: true,
                      height: 36,
                      donotShowIcon: true,
                      backgroundColor: Cr.accentBlue3,
                      child: Text(
                        "Add to lists",
                        style: bodySmallRegular.copyWith(
                          color: Cr.accentBlue1,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Di.PSL,
                    vertical: 24,
                  ),
                  child:
                      //  widget.userProfileData.expertise != null
                      //     ?
                      Wrap(
                    children: List<Widget>.generate(
                      expertise.length,
                      (int idx) {
                        return Padding(
                          padding: const EdgeInsets.all(Di.PSES),
                          child: CustomCheckboxWithTitle(
                            title: expertise[idx].title ?? "",
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  // : Di.ESB,
                ),
                Di.SBHS,
                SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: 35,
                      child: Row(
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
                              Nav.pop(context);
                              await User(
                                expertise: expertise,
                              ).save(ref
                                  .watch(profileNotifierProvider)
                                  .userProfileData!);
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
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
