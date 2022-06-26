import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_write_reference_dialog_widget.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileWriteReferenceDialogWidget(
                userProfileData: User(),
              ),
              Di.SBHOL,
              // CustomElevatedButton(
              //   width: 200,
              //   text: "Languages",
              //   onPressed: () {
              //     showCustomDialog(
              //       context,
              //       ProfileWriteReferenceDialogWidget(
              //         userProfileData: User(),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
