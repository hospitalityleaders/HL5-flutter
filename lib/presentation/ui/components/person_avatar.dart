import 'package:flutter/material.dart';

class PersonAvatar extends StatelessWidget {
  const PersonAvatar({
    Key? key,
    this.avatarSize,
  }) : super(key: key);

  final double? avatarSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: avatarSize ?? 28,
      height: avatarSize ?? 28,
      decoration: BoxDecoration(
        image: DecorationImage(
          // image: NetworkImage(DbData.getUserProfileData.avatar ?? ""),
          image: AssetImage("assets/images/profile.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
