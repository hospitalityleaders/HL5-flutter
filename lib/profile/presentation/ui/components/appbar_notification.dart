import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';

import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:routemaster/routemaster.dart';

enum AppbarNotificationColor {
  red,
  green,
  blue,
  orange,
  // dark,
}

class AppNotify extends Model {
  String? title;
  String? buttonText;
  Function()? onButtonPressed;
  AppbarNotificationColor appbarNotificationColor;

  AppNotify(
      {this.title,
      this.buttonText,
      this.onButtonPressed,
      this.appbarNotificationColor = AppbarNotificationColor.red});

  dynamic notify(BuildContext context) {
    return _AppbarSingleNotification(
      appbarNotificationColor: this.appbarNotificationColor,
      buttonText: this.buttonText,
      title: this.title as String,
      onButtonPressed: this.onButtonPressed,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'buttonText': buttonText,
        'onButtonPressed': onButtonPressed,
        'appbarNotificationColor': appbarNotificationColor,
      };
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
            appbarNotificationColor: AppbarNotificationColor.green,
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

class AppbarNotification extends StatefulWidget implements PreferredSizeWidget {
  AppbarNotification({
    Key? key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<AppbarNotification> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context, listen: true);
    if (appState.notify != null)
      print('msg ${appState.notify?.notify(context).toString()}');
    return Provider.of<ProfileProvider>(context).appNotificationState.map(
          showNothing: (_) => Di.ESB,
          profileCompletion: (notification) => appState.isLoggedIn
              ? Provider.of<ProfileProvider>(context)
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
                    )
              : appState.notify != null
                  ? appState.notify?.notify(context)
                  : Container(),
          sucess: (notification) => appState.isLoggedIn
              ? _AppbarSingleNotification(
                  appbarNotificationColor: AppbarNotificationColor.green,
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
                )
              : appState.notify != null
                  ? appState.notify?.notify(context)
                  : Container(),
        );
  }
}

class _AppbarSingleNotification extends StatelessWidget {
  const _AppbarSingleNotification({
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
