import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:provider/provider.dart';

class EditCardSheet extends StatelessWidget {
  const EditCardSheet(
    this.context, {
    Key? key,
  }) : super(key: key);
  final BuildContext context;

  @override
  Widget build(_) {
    if (Provider.of<ProfileProvider>(context).isProfileEditable) {
      return Container(
        // width: 560,
        height: DbData.getUserProfileData.expertise!.length < 3 ? 100 : null,
        color: Cr.accentBlue2.withOpacity(.8),
        padding: EdgeInsets.all(Di.PSD),
      );
    } else {
      return Di.ESB;
    }
  }
}
