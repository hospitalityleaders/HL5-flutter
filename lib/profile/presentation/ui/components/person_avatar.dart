import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/models/models.dart';

class PersonAvatar extends ConsumerWidget {
  const PersonAvatar({
    Key? key,
    this.avatarSize,
  }) : super(key: key);

  final double? avatarSize;

  @override
  Widget build(BuildContext context, ref) {
    final isLogin = Provider.of<AppState>(context).isLoggedIn;
    return Container(
      width: avatarSize ?? 28,
      height: avatarSize ?? 28,
      decoration: BoxDecoration(
        image: isLogin
            ? DecorationImage(
                image: NetworkImage(ref
                        .watch(profileNotifierProvider)
                        .userProfileData!
                        .avatar ??
                    ""),
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
