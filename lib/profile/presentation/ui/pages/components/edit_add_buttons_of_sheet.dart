import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/edit_icon_buttton.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
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
  Widget build(BuildContext context) {
    return (Provider.of<ProfileProvider>(context).isProfileEditable)
        ? Center(
            child: SizedBox(
              width: 200,
              height: 100,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EditIconButton(
                      onPressed: onEditPressed,
                    ),
                    if (onAddPressed != null) Di.SBWS,
                    if (onAddPressed != null)
                      EditIconButton(
                        iconData: Icons.add,
                        onPressed: onAddPressed,
                      ),
                  ],
                ),
              ),
            ),
          )
        : Di.ESB;
  }
}
