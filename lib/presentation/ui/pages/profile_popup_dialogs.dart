import 'package:flutter/material.dart';

import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

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

class ProfileExpertiseDialogWidget extends StatefulWidget {
  const ProfileExpertiseDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileExpertiseDialogWidget> createState() =>
      _ProfileExpertiseDialogWidgetState();
}

class _ProfileExpertiseDialogWidgetState
    extends State<ProfileExpertiseDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  List<String> newTextField = [""];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
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
                boxShadow: Styles.defaultBoxShadow,
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
                      Text(
                        "Languages",
                        style: h2Regular,
                      ),
                      GestureDetector(
                        onTap: () => Nav.pop(context),
                        child: Icon(
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
              padding: EdgeInsets.all(Di.PSL),
              margin: EdgeInsets.all(Di.PSL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "What are your areas of expertise",
                        style: h5Bold,
                      ),
                      Di.SBWES,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                        child: TextFormField(
                          style: bodySmallRegular.copyWith(
                            color: Cr.darkGrey1,
                          ),
                          decoration:
                              Styles.popUpDialogTextFieldInputDecoration,
                        ),
                      ),
                      Di.SBWES,
                      CustomElevatedButton(
                        borderColor: Cr.accentBlue2,
                        makeWidthNull: true,
                        // onPressed: () => Nav.pop(context),
                        child: Text(
                          "Add to lists",
                          style: bodySmallRegular.copyWith(
                            color: Cr.accentBlue1,
                          ),
                        ),
                        height: 36,
                        donotShowIcon: true,
                        backgroundColor: Cr.accentBlue3,
                      ),
                    ],
                  ),
                  Di.SBHS,
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomElevatedButton(
                              borderColor: Cr.accentBlue2,
                              makeWidthNull: true,
                              onPressed: () => Nav.pop(context),
                              child: Text(
                                "Cancel",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.accentBlue1,
                                ),
                              ),
                              height: 36,
                              donotShowIcon: true,
                              backgroundColor: Cr.accentBlue3,
                            ),
                            Di.SBWES,
                            CustomElevatedButton(
                              borderColor: Cr.accentBlue2,
                              makeWidthNull: true,
                              onPressed: () async {
                                // Nav.pop(context);
                                // await new User(
                                //   profileSummary:
                                //       _profileSummaryController.text,
                                // ).save(widget.userProfileData);
                              },
                              child: Text(
                                "Save",
                                style: bodySmallRegular.copyWith(
                                  color: Cr.whiteColor,
                                ),
                              ),
                              height: 36,
                              donotShowIcon: true,
                              backgroundColor: Cr.accentBlue1,
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
      ),
    );
  }

  List<Widget> getNewTextFormFields() {
    var textField = <Widget>[];
    for (var i = 0; i < newTextField.length; i++) {
      textField.add(
        Padding(
          padding: const EdgeInsets.only(bottom: Di.PSS),
          child: Row(
            children: [
              SizedBox(
                width: 185,
                child: TextFormField(
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                  decoration: Styles.popUpDialogTextFieldInputDecoration,
                ),
              ),
              SizedBox(width: 18),
              SizedBox(
                width: 335,
                height: 36,
                child: DropdownButtonFormField2(
                  decoration: Styles.popUpDialogTextFieldInputDecoration,
                  isExpanded: true,
                  hint: Text(
                    'Select Proficiency',
                    style: bodySmallRegular.copyWith(
                      color: Cr.darkGrey1,
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 20,
                  buttonPadding: const EdgeInsets.symmetric(
                    horizontal: Di.PSETS,
                  ),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  items: [
                    "Native",
                    "Billingual",
                  ]
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: bodySmallRegular.copyWith(
                                color: Cr.darkGrey1,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  // onSaved: (value) {
                  //   selectedValue = value.toString();
                  // },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    newTextField.removeAt(i);
                  });
                },
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: SvgPicture.asset(
                      Svgs.close,
                      width: 16,
                      color: Cr.accentBlue1,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        // Row(
        //   children: [
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: TextFormField(
        //           onChanged: (value) {
        //             setState(() {
        //               newTextField[i] = value;
        //             });
        //           },
        //           validator: (value) {
        //             return "slkdfjlksd";
        //           },
        //           decoration: InputDecoration(
        //             hintText: '${i + 1} Text field',
        //           ),
        //         ),
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         setState(() {
        //           newTextField.removeAt(i);
        //         });
        //       },
        //       icon: Icon(
        //         Icons.remove_circle,
        //         color: Colors.red,
        //         size: 30,
        //       ),
        //     )
        //   ],
        // ),
      );
    }
    return textField;
  }
}
