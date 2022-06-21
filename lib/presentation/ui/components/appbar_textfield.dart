import 'package:flutter/material.dart';
import 'package:holedo/common/common_widget.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';

class AppbarTextField extends StatelessWidget {
  const AppbarTextField({
    Key? key,
    this.width,
    this.showPeopleButton = true,
  }) : super(key: key);

  final double? width;
  final bool showPeopleButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 320,
      decoration: BoxDecoration(
        color: ColorPicker.kWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(2),
      child: TextFormField(
        // controller: _searchController,
        // onChanged: (_) => _search(), // , onSubmitted: (_) => _search(),
        cursorColor: ColorPicker.kWhite,
        style: FontTextStyle.kWhite18W600PR,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
          filled: true,
          fillColor: ColorPicker.kPrimaryLight,
          hintText: "Search",
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPicker.kPrimary),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPicker.kPrimary),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPicker.kPrimary),
              borderRadius: BorderRadius.circular(5)),
          prefixIcon: Icon(
            Icons.search,
            color: ColorPicker.kPrimaryLightBlue,
          ),
          suffixIcon: showPeopleButton
              ? Container(
                  margin: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                  height: 40,
                  width: 87,
                  decoration: BoxDecoration(
                    color: ColorPicker.kPrimaryLight1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: CommonWidget.text(
                      'People',
                      style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
