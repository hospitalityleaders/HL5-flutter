import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/nav.dart';

class Csd {
  static void customErrorDialog(
    BuildContext context,
    String message,
  ) =>
      _customAwesomeDialog(
        context,
        title: "Error",
        description: message,
        dialogType: DialogType.ERROR,
      );

  static void customSuccessrDialog(
    BuildContext context,
    String message,
  ) =>
      _customAwesomeDialog(
        context,
        title: "Successr",
        description: message,
        dialogType: DialogType.SUCCES,
      );
}

void _customAwesomeDialog(
  BuildContext context, {
  required String title,
  required String description,
  required DialogType dialogType,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: title,
    // btnCancelOnPress: () {},
    btnOkOnPress: () {
      Nav.pop(context);
    },
  );
}
