
import 'package:flutter/material.dart';

class ProfileEdit {
  static bool isEditable = false;
  static Padding buildProfileEdit(_width, _height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _width,
        height: _height,
        color: const Color(0xFF79d5ff).withOpacity(0.5),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
            child: IconButton(
              onPressed: () {},
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


