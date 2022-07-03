import 'package:flutter/material.dart';
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

class ProfilePopupDialogScreen extends StatefulWidget {
  const ProfilePopupDialogScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePopupDialogScreen> createState() =>
      _ProfilePopupDialogScreenState();
}

class _ProfilePopupDialogScreenState extends State<ProfilePopupDialogScreen> {
  Image? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cr.accentBlue1,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (image != null) image!,

              Di.SBHOL,
              // UploadWidgetButton(
              //   uploadedImgCallback: (image) async {
              //     print("image is $image");
              //   },
              //   pickedImgCallback: (Image pickedImage) async {
              //     setState(() {
              //       image = pickedImage;
              //     });
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
