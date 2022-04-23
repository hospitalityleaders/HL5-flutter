import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/sizedbox.dart';

class DropDownButton extends StatefulWidget {
  final List menuList;
  final hintText;

  DropDownButton({Key? key, this.hintText, required this.menuList})
      : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonHideUnderline(
          child: Container(
            height: 36,
            decoration: BoxDecoration(
                color: ColorPicker.kGreyLight9,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(width: 2, color: ColorPicker.kGreyLight9)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton2(
                hint: Text('${widget.hintText}'),
                value: selectValue,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    selectValue = newValue as String;
                  });
                },
                items: widget.menuList
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        SS.sB(18)
      ],
    );
  }
}
