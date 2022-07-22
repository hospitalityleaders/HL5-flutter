import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';

import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

enum _AppbarNotificationColor {
  red,
  green,
  blue,
  orange,
  // dark,
}

class AppbarNotifications extends StatelessWidget {
  const AppbarNotifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<ProfileProvider>(context).appNotificationState.map(
          showNothing: (_) => Di.ESB,
          profileCompletion: (notification) =>
              Provider.of<ProfileProvider>(context)
                          .percentageProfileCompleted ==
                      100
                  ? Di.ESB
                  : _AppbarSingleNotification(
                      title:
                          "Your profile is only ${Provider.of<ProfileProvider>(context).percentageProfileCompleted}% complete. Complete it now to earn first Hospitality Leader grade.",
                      onButtonPressed: () {
                        // ref
                        //     .watch(profileNotifierProvider.notifier)
                        Provider.of<ProfileProvider>(context, listen: false)
                            .changeIsProfieEditableState(
                          true,
                        );
                      },
                    ),
          sucess: (notification) => _AppbarSingleNotification(
            appbarNotificationColor: _AppbarNotificationColor.green,
            buttonText: "View profile",
            title: "Your profile has been successfully updated.",
            onButtonPressed: () {
              // ref.watch(profileNotifierProvider.notifier)
              Provider.of<ProfileProvider>(context, listen: false)
                ..changeIsProfieEditableState(false)
                ..changeAppNotificationState(
                  const AppNotificationState.showNothing(),
                );
            },
          ),
        );
  }
}

class _AppbarSingleNotification extends StatelessWidget {
  const _AppbarSingleNotification({
    Key? key,
    required this.title,
    this.buttonText,
    this.onButtonPressed,
    this.appbarNotificationColor = _AppbarNotificationColor.red,
  }) : super(key: key);

  final void Function()? onButtonPressed;
  final String title;
  final String? buttonText;
  final _AppbarNotificationColor appbarNotificationColor;
  @override
  Widget build(BuildContext context) {
    late final Color bgColor;
    late final Color textAndButtonColor;
    switch (appbarNotificationColor) {
      case _AppbarNotificationColor.green:
        bgColor = Cr.green3;
        textAndButtonColor = Cr.green1;
        break;
      case _AppbarNotificationColor.blue:
        bgColor = Cr.accentBlue3;
        textAndButtonColor = Cr.accentBlue1;
        break;
      case _AppbarNotificationColor.orange:
        bgColor = Cr.orange3;
        textAndButtonColor = Cr.orange1;
        break;
      case _AppbarNotificationColor.red:
        bgColor = Cr.red3;
        textAndButtonColor = Cr.red1;
        break;
      default:
        bgColor = Cr.red3;
        textAndButtonColor = Cr.red1;
    }
    return Container(
      height: 50,
      width: Di.getScreenSize(context).width,
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Di.ESB,
          Row(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: bodyLarge.copyWith(
                  color: textAndButtonColor,
                ),
              ),
              Di.SBWS,
              CustomElevatedButton(
                onPressed: onButtonPressed,
                text: buttonText,
                customPadding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                height: 32,
                makeWidthNull: true,
                backgroundColor: textAndButtonColor,
                donotShowIcon: true,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Provider.of<ProfileProvider>(context, listen: false)
                  .changeAppNotificationState(
                      AppNotificationState.showNothing());
            },
            child: Icon(
              Icons.close,
              color: textAndButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}
