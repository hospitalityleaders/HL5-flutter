import 'package:flutter/material.dart';

import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';

class TextFieldAndFieldName {
  /// build field Name Common start

  static Widget buildFieldName(String fieldName, [String? reqField]) {
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

  static Widget buildTextField([String? hintText,TextEditingController? _controller]) {
    return Column(
      children: [
        Container(

          height: 36,
          decoration: BoxDecoration(
              color: ColorPicker.kGreyLight9,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: ColorPicker.kGreyLight7,
                width: 0.2,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,

                hintText: hintText,
                // border: OutlineInputBorder(
                //
                //     borderRadius: BorderRadius.circular(2),
                //     borderSide:
                //         BorderSide(color: ColorPicker.kGreyLight9, width:0.1, )),
              ),
            ),
          ),
        ),
        SS.sB(18),
      ],
    );
  }

  /// build field Name Common end

}
