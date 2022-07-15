import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/application/shared/providers.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class EditBlueCardSheet extends StatelessWidget {
  const EditBlueCardSheet(
    this.context, {
    Key? key,
    this.dataIsNull = false,
    required this.greenCardText,
    this.greenCardTip,
    this.onAddPressed,
  }) : super(key: key);
  final BuildContext context;
  final bool dataIsNull;
  final String greenCardText;
  final String? greenCardTip;
  final void Function()? onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        if (ref.watch(profileNotifierProvider).isProfileEditable) {
          return dataIsNull
              ? Container(
                  color: Cr.green3,
                  padding: const EdgeInsets.only(
                    left: Di.PSL,
                    right: Di.PSL,
                    bottom: Di.PSL,
                    top: Di.PSD,
                  ),
                  child: Column(
                    children: [
                      Text(
                        greenCardText,
                        style: h2Regular.copyWith(
                          color: Cr.green1,
                        ),
                      ),
                      Di.SBCH(32),
                      if (greenCardTip != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "TIP",
                              style: dividerTextLarge.copyWith(),
                            ),
                            Text(
                              greenCardTip!,
                              style: bodyLarge.copyWith(
                                color: Cr.darkGrey1,
                              ),
                            ),
                            Di.SBCH(32),
                          ],
                        ),
                      GestureDetector(
                        onTap: onAddPressed,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: boxDecorationCircle.copyWith(
                            color: Cr.green1,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Cr.whiteColor,
                            // size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  // width: 560,
                  // height:
                  //     DbData.getUserProfileData.expertise!.length < 3 ? 100 : null,
                  color: Cr.accentBlue2.withOpacity(.8),
                  padding: const EdgeInsets.all(Di.PSD),
                );
        } else {
          return Di.ESB;
        }
      },
    );
  }
}
