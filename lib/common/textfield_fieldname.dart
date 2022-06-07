import 'package:flutter/material.dart';

import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';

class TextFieldAndFieldName {
  /// build field Name Common start

  static buildFieldName(String fieldName, [String? reqField]) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: '$fieldName ',
              style: FontTextStyle.kBlueDark118W700SSP,
              children: [
                TextSpan(
                    text: reqField, style: FontTextStyle.kBlueLight114W400SSP),
              ]),
        ),
        SS.sB(5)
      ],
    );
  }

  static buildTextField([String? hintText]) {
    return Column(
      children: [
        Container(
          height: 36,
          color: ColorPicker.kGreyLight9,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide:
                      BorderSide(color: ColorPicker.kGreyLight9, width: 2)),
            ),
          ),
        ),
        SS.sB(18),
      ],
    );
  }

  /// build field Name Common end

}
