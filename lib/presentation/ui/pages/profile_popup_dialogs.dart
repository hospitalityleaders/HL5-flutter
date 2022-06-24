import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              width: 200,
              text: "Profile Summary",
              onPressed: () {
                // showCustomDialog(context, child);
              },
            ),
          ],
        ),
      ),
    );
  }
}
