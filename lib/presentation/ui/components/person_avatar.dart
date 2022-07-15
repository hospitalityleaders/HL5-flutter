import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/models.dart';

class PersonAvatar extends StatelessWidget {
  const PersonAvatar({
    Key? key,
    this.avatarSize,
  }) : super(key: key);

  final double? avatarSize;

  @override
  Widget build(BuildContext context) {
    final isLogin = Provider.of<AppState>(context).isLoggedIn;
    return Container(
      width: avatarSize ?? 28,
      height: avatarSize ?? 28,
      decoration: BoxDecoration(
        image: isLogin
            ? DecorationImage(
                image: NetworkImage(DbData.getUserProfileData.avatar ?? ""),
                fit: BoxFit.cover,
              )
            : const DecorationImage(
                image: AssetImage("assetName"),
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
