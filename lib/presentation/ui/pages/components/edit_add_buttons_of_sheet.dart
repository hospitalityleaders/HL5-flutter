import 'package:flutter/material.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/edit_icon_buttton.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:provider/provider.dart';

class EditAddButtonOfSheet extends StatelessWidget {
  const EditAddButtonOfSheet(
    this.context, {
    Key? key,
    required this.onEditPressed,
    this.onAddPressed,
  }) : super(key: key);
  final BuildContext context;
  final void Function() onEditPressed;
  final void Function()? onAddPressed;
  @override
  Widget build(_) {
    if (Provider.of<ProfileProvider>(context).isProfileEditable)
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Di.PSL),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              EditIconButton(
                onPressed: onEditPressed,
              ),
              if (onAddPressed != null) ...[
                Di.SBWS,
                EditIconButton(
                  iconData: Icons.add,
                  onPressed: onAddPressed,
                ),
              ]
            ],
          ),
        ),
      );
    else
      return Di.ESB;
  }
}
