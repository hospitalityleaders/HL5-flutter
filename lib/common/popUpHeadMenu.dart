import 'dart:js';

import 'package:flutter/material.dart';

import '../constant/colorPicker/color_picker.dart';

class PopUpHeadMenu {
  static Container popUpHead(String headName,BuildContext context) {
      return Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      headName,
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
  }

