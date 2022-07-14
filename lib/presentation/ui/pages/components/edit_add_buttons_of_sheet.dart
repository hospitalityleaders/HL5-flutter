import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/application/shared/providers.dart';
import 'package:holedo/presentation/ui/components/edit_icon_buttton.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

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
    // return Di.ESB;
    return Consumer(
      builder: (context, ref, child) {
        if (ref.watch(profileNotifierProvider).isProfileEditable) {
          return Center(
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
          );
        } else {
          return Di.ESB;
        }
      },
    );
  }
}
