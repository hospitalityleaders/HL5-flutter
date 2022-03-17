import 'package:flutter/material.dart';

class ProfileEdit {
  static bool isEditable = false;

  static Padding buildProfileEdit({required double width, required double height, required popUp}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        color: const Color(0xFF79d5ff).withOpacity(0.5),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
            child: IconButton(
              onPressed: popUp,
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
