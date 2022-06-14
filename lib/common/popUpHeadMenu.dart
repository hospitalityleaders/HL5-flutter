// import 'dart:js';

import 'package:flutter/material.dart';

import '../constant/colorPicker/color_picker.dart';
import '../constant/fontStyle/font_style.dart';
import '../constant/sizedbox.dart';

class PopUpHeadMenu {
  static Container popUpHead(String headName, BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
                  child: Text(
                    headName,
                    style: FontTextStyle.kBlueDark120W400SSP,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: ColorPicker.kBlueLight,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Reference card popUp

  static bool isOpen1 = false;
  static bool isOpen2 = false;
  static String refContent =
      '''Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.''';

  static Future<String?> buildReferencesCardPopUp(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          child: Container(
            color: ColorPicker.kGreyLight3,
            width: (SS.sW(context) as double) * .50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PopUpHeadMenu.popUpHead('My references', context),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          ''' Select from your references below which ones you would like to display on your profile overview. You can display up to two references to show on your profile overview.''',
                          style: FontTextStyle.kGreyLight516W400SSP,
                          textAlign: TextAlign.center,
                        ),
                        SS.sB(10, 0),
                        Container(
                          height: 60,
                          color: ColorPicker.kGreenNeon,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'You’ve got a new reference! All you have to do now is approve it.',
                                style: FontTextStyle.kWhite14W400SSP,
                              ),
                              StatefulBuilder(
                                builder: (context, setState) => OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.transparent),
                                  child: Text(
                                    'Approve Reference',
                                    style: FontTextStyle.kWhite14W600PR,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: ColorPicker.kWhite,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image(
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/789822/pexels-photo-789822.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  title: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Ealasiad Wang',
                                          style: FontTextStyle
                                              .kBlueDark116W700SSP),
                                      TextSpan(
                                          text: ' MHL',
                                          style: FontTextStyle
                                              .kBlueDark112W700SSP),
                                    ]),
                                  ),
                                  subtitle: Text(
                                    'Recruiter, Top Talent Recruiters',
                                    style: FontTextStyle.kGreyLight514W400SSP,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                          child: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: ColorPicker.kRedlight,
                                      )),
                                      InkWell(
                                        onTap: () {},
                                        child: Card(
                                            child: Icon(Icons
                                                .arrow_drop_down_outlined)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                height: 0.1,
                                color: ColorPicker.kGreyLight3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: ColorPicker.kWhite,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedContainer(
                                            height: isOpen1 ? 120 : 0,
                                            color: ColorPicker.kWhite,
                                            duration: Duration(seconds: 1),
                                            alignment: isOpen1
                                                ? Alignment.topCenter
                                                : Alignment.bottomCenter,
                                            curve: Curves.fastOutSlowIn,
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(refContent,
                                                    style: FontTextStyle
                                                        .kGreyLight516W400SSP),
                                              ),
                                            )),
                                        TextButton.icon(
                                          label: Text(isOpen1
                                              ? 'Hide reference'
                                              : 'Show reference'),
                                          icon: Icon(isOpen1
                                              ? Icons.remove
                                              : Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              isOpen1 = !isOpen1;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SS.sB(10, 0),
                        Container(
                          color: ColorPicker.kWhite,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image(
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/789822/pexels-photo-789822.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  title: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Ealasiad Wang',
                                          style: FontTextStyle
                                              .kBlueDark116W700SSP),
                                      TextSpan(
                                          text: ' MHL',
                                          style: FontTextStyle
                                              .kBlueDark112W700SSP),
                                    ]),
                                  ),
                                  subtitle: Text(
                                    'Recruiter, Top Talent Recruiters',
                                    style: FontTextStyle.kGreyLight514W400SSP,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                          child: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: ColorPicker.kRedlight,
                                      )),
                                      InkWell(
                                        onTap: () {},
                                        child: Card(
                                            child: Icon(Icons
                                                .arrow_drop_down_outlined)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                height: 0.1,
                                color: ColorPicker.kGreyLight3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: ColorPicker.kWhite,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedContainer(
                                          height: isOpen2 ? 120 : 0,
                                          color: ColorPicker.kWhite,
                                          duration: Duration(seconds: 1),
                                          alignment: isOpen2
                                              ? Alignment.topCenter
                                              : Alignment.bottomCenter,
                                          curve: Curves.fastOutSlowIn,
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(refContent,
                                                  style: FontTextStyle
                                                      .kGreyLight516W400SSP),
                                            ),
                                          ),
                                        ),
                                        TextButton.icon(
                                          label: Text(isOpen2
                                              ? 'Hide reference'
                                              : 'Show reference'),
                                          icon: Icon(isOpen2
                                              ? Icons.remove
                                              : Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              isOpen2 = !isOpen2;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
