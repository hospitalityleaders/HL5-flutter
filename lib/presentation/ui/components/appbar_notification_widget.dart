import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

enum AppbarNotificationColor {
  red,
  green,
  blue,
  orange,
  // dark,
}

class AppbarNotificationWidget extends StatelessWidget {
  const AppbarNotificationWidget({
    Key? key,
    required this.title,
    this.buttonText,
    this.onButtonPressed,
    this.appbarNotificationColor = AppbarNotificationColor.red,
  }) : super(key: key);

  final void Function()? onButtonPressed;
  final String title;
  final String? buttonText;
  final AppbarNotificationColor appbarNotificationColor;
  @override
  Widget build(BuildContext context) {
    late final Color bgColor;
    late final Color textAndButtonColor;
    switch (appbarNotificationColor) {
      case AppbarNotificationColor.green:
        bgColor = Cr.green3;
        textAndButtonColor = Cr.green1;
        break;
      case AppbarNotificationColor.blue:
        bgColor = Cr.accentBlue3;
        textAndButtonColor = Cr.accentBlue1;
        break;
      case AppbarNotificationColor.orange:
        bgColor = Cr.orange3;
        textAndButtonColor = Cr.orange1;
        break;
      case AppbarNotificationColor.red:
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
                width: 97,
                height: 32,
                backgroundColor: textAndButtonColor,
                donotShowIcon: true,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Provider.of<ProfileProvider>(context, listen: false)
                  .changeAppNotificationState(
                AppNotificationState.showNothing(),
              );
            },
            child: Icon(
              Icons.close,
              color: Cr.redTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
