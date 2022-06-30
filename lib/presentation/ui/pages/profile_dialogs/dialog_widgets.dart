import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

void dialogCircularProgressIndicator(BuildContext context) {
  showCustomDialog(
    context,
    Container(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(),
    ),
  );
}

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

class HelpIconDialog extends StatelessWidget {
  const HelpIconDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Svgs.helpCircle,
      color: Cr.accentBlue1,
      width: 10,
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
    this.prefixIcon,
  }) : super(key: key);

  final double? width;
  final List<String> dataList;
  final String hintText;
  final bool disable;
  final Widget? prefixIcon;

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
            prefixIcon,
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

class CustomMinusIcon extends StatelessWidget {
  const CustomMinusIcon({
    Key? key,
    this.widthHeight,
    this.minusWidth,
  }) : super(key: key);

  final double? widthHeight;
  final double? minusWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthHeight ?? 16,
      height: widthHeight ?? 16,
      child: Center(
        child: Container(
          width: minusWidth ?? 9.5,
          height: 1.5,
          color: Cr.accentBlue1,
        ),
      ),
    );
  }
}

class DialogMultiLineTextField extends StatelessWidget {
  const DialogMultiLineTextField({
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
      width: width ?? 555,
      child: TextFormField(
        controller: textEditingController,
        style: bodySmallRegular.copyWith(
          color: Cr.darkGrey1,
        ),
        maxLines: 100,
        minLines: 5,
        decoration: Styles.popUpDialogTextFieldInputDecoration.copyWith(
          // hintText: hintText,
          hintStyle: bodySmallRegular.copyWith(color: Cr.darkGrey4),
        ),
      ),
    );
  }
}

class CheckboxDialog extends StatelessWidget {
  const CheckboxDialog({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final bool value;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith((_) => const BorderSide(
                width: 1,
                color: Cr.darkGrey4,
              )),
          fillColor: MaterialStateProperty.all(Colors.white),
          checkColor: MaterialStateProperty.all(Cr.accentBlue1),
        ),
      ),
      child: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
