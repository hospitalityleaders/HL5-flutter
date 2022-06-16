import 'package:flutter/material.dart';
import 'package:holedo/common/textfield_fieldname.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import '../constant/colorPicker/color_picker.dart';
import '../constant/sizedbox.dart';
import '../responsive/responsive.dart';

class BuildWorkExpPopUp {
  Widget buildExpInnerCard(
      bool isExperienceEditable, bool isExperienceShowCard, int indexExp) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Container(
          width: Responsive.isDesktop(context)
              ? SS.sW(context) * .50
              : Responsive.isMobile(context)
                  ? SS.sW(context) * .90
                  : SS.sW(context) * .60,
          color: ColorPicker.kWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    color: ColorPicker.kBlueLight1,
                    child: Icon(
                      Icons.apartment_rounded,
                      size: 18,
                      color: ColorPicker.kWhite,
                    ),
                  ),
                  title: Text(
                    'General Manager',
                    style: FontTextStyle.kBlueDark116W700SSP,
                  ),
                  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fairmont Zimbali Resort · Cape Town',
                        style: FontTextStyle.kBlueLight114W400SSP,
                      ), Text(
                        'February 2012 – January 2013 (11 months)',
                        style: FontTextStyle.kGreyLight514W400SSP,
                      ),

                    ],
                  ),
                  trailing: isExperienceEditable
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isExperienceShowCard = !isExperienceShowCard;
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 10,
                            color: ColorPicker.kBlueLight1,
                          ),
                        )
                      : null,
                ),
                isExperienceShowCard
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(
                              height: SS.sH(context) * 0.01,
                              color: ColorPicker.kGreyLight3,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFieldAndFieldName.buildFieldName(
                                      'Title / position', '*'),
                                  TextFieldAndFieldName.buildTextField(
                                      'General manager'),
                                  TextFieldAndFieldName.buildFieldName(
                                      'Company name', '*'),
                                  TextFieldAndFieldName.buildTextField(
                                      'Fairmont Zimbali Resort'),
                                  TextFieldAndFieldName.buildFieldName(
                                      'Company website'),
                                  TextFieldAndFieldName.buildTextField(
                                      'www.fairmontzimbali.com'),
                                  TextFieldAndFieldName.buildFieldName(
                                      'Job description'),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      autocorrect: true,
                                      minLines: 4,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Text('Cancel')),
                                      SS.sB(0, 10),
                                      ElevatedButton(
                                          onPressed: () {}, child: Text('Save'))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
    });
  }
}
