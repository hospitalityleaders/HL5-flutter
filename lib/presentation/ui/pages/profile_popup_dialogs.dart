import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_expertise_dialog_widget.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        breakpoints: [
          // ResponsiveBreakpoint.resize(450, name: MOBILE),
          // ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePopupDialogScreen(),
    );
  }
}

class ProfilePopupDialogScreen extends StatelessWidget {
  const ProfilePopupDialogScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cr.accentBlue1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileExpertiseDialogWidget(
              userProfileData: User(),
            ),
            Di.SBHOL,
            // CustomElevatedButton(
            //   width: 200,
            //   text: "Languages",
            //   onPressed: () {
            //     showCustomDialog(
            //       context,
            //       ProfileExpertiseDialogWidget(
            //         userProfileData: User(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
