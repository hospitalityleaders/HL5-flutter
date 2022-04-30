import 'package:flutter/material.dart';

class ProfileEdit {
  static Padding buildProfileEdit({
    required double width,
    required double height,
    required popUpEdit,
    required bool showAddButton,
    popUpAdd,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        color: const Color(0xFF79d5ff).withOpacity(0.5),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: IconButton(
                  onPressed: popUpEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 6),
              showAddButton
                  ? CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: IconButton(
                        onPressed: popUpAdd,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class EditButton extends StatefulWidget {
  late final ValueChanged onChanged;
  final isEditable;
  final callBackHeader;
  final headerCardKey;
  final callBackButtonSec1;
  final profileOverviewSec1ProSummKey;
  final profileOverviewSec1AreaOfExpKey;
  final profileOverviewSec1ReferencesKey;
  final callBackButtonSec2;
  final profileOverviewSec2WorkExpKey;
  final profileOverviewSec2EducationKey;
  final profileOverviewSec2AchievementKey;
  final profileOverviewSec2LanguagesKey;
  final callBackReference;
  final referenceCardKey;

  EditButton({
    Key? key,
    required this.callBackHeader,
    this.headerCardKey,
    required this.onChanged,
    required this.isEditable,
    required this.callBackButtonSec1,
    this.profileOverviewSec1ProSummKey,
    this.profileOverviewSec1AreaOfExpKey,
    this.profileOverviewSec1ReferencesKey,
    required this.callBackButtonSec2,
    this.profileOverviewSec2WorkExpKey,
    this.profileOverviewSec2EducationKey,
    this.profileOverviewSec2AchievementKey,
    this.profileOverviewSec2LanguagesKey,
   required this.callBackReference,
    this.referenceCardKey,
  }) : super(key: key);

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        widget.onChanged(widget.isEditable);

        widget.callBackHeader(
          widget.headerCardKey.currentContext.size,
        );

        widget.callBackButtonSec1(
          widget.profileOverviewSec1ProSummKey.currentContext.size,
          widget.profileOverviewSec1AreaOfExpKey.currentContext.size,
          widget.profileOverviewSec1ReferencesKey.currentContext.size,
        );
        widget.callBackButtonSec2(
          widget.profileOverviewSec2WorkExpKey.currentContext.size,
          widget.profileOverviewSec2EducationKey.currentContext.size,
          widget.profileOverviewSec2AchievementKey.currentContext.size,
          widget.profileOverviewSec2LanguagesKey.currentContext.size,
        );

        widget.callBackReference(
          widget.referenceCardKey.currentContext.size,
        );
      },
      label: widget.isEditable
          ? Text(
              'Done editing',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            )
          : Text(
              'Edit Profile',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
      icon: widget.isEditable
          ? Icon(
              Icons.done,
              size: 9,
            )
          : Icon(
              Icons.edit,
              size: 9,
            ),
      style: ElevatedButton.styleFrom(
          primary: widget.isEditable ? Color(0xFF7DC81B) : Color(0xFF32A3FD)),
    );
  }
}
