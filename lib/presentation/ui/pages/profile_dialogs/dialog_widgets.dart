import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: Cr.accentBlue1,
          size: 8,
        )
      ],
    );
  }
}

class DialogTitleWidget extends StatelessWidget {
  const DialogTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                title,
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
    );
  }
}

class DialogTextFieldForm extends StatelessWidget {
  const DialogTextFieldForm({
    Key? key,
    this.textEditingController,
    this.width,
    this.hintText,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final double? width;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: textEditingController,
        style: bodySmallRegular.copyWith(
          color: Cr.darkGrey1,
        ),
        decoration: Styles.popUpDialogTextFieldInputDecoration.copyWith(
          hintText: hintText,
          hintStyle: bodySmallRegular.copyWith(color: Cr.darkGrey4),
        ),
      ),
    );
  }
}

class DialogLabelTextFormField extends StatelessWidget {
  const DialogLabelTextFormField({
    Key? key,
    required this.customLabel,
    this.width,
    this.isImportant = true,
    this.icon,
  }) : super(key: key);

  final String customLabel;
  final double? width;
  final bool isImportant;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 520,
      child: isImportant
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  customLabel,
                  style: h5Bold,
                ),
                Di.SBWES,
                icon ?? StarIcon(),
              ],
            )
          : Text(
              customLabel,
              style: h5Bold,
            ),
    );
  }
}

class DialogDropDownTextField extends StatelessWidget {
  const DialogDropDownTextField({
    Key? key,
    this.width,
    required this.dataList,
    required this.hintText,
    this.disable = false,
  }) : super(key: key);

  final double? width;
  final List<String> dataList;
  final String hintText;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disable,
      child: SizedBox(
        width: width ?? 250,
        height: 36,
        child: DropdownButtonFormField2(
          decoration: Styles.popUpDialogTextFieldInputDecorationFunction(
            disable ? Cr.lightGrey2 : null,
          ),
          isExpanded: true,
          hint: Text(
            hintText,
            style: bodySmallRegular.copyWith(
              color: disable ? Cr.grey2 : Cr.darkGrey1,
            ),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: disable ? Cr.grey2 : Cr.darkGrey1,
          ),
          iconSize: 20,

          buttonPadding: const EdgeInsets.symmetric(
            horizontal: Di.PSETS,
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),

          items: dataList
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: bodySmallRegular.copyWith(
                        color: disable ? Cr.grey2 : Cr.darkGrey1,
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
    );
  }
}
