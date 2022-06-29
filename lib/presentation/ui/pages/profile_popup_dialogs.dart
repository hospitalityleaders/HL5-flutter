import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/contact_card_dialog_widget.dart';
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
              SizedBox(
                child: ContactCardDialogWidget(),
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
