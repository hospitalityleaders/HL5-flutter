import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/rounded_icon_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({
    Key? key,
    this.onPressed,
    this.iconData,
  }) : super(key: key);

  final void Function()? onPressed;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return RoundeIconButton(
      onPressed: onPressed,
      backgroundColor: Cr.accentBlue1,
      icon: Icon(
        iconData ?? Icons.edit,
        color: Cr.whiteColor,
      ),
    );
  }
}





// class EditIconButton extends StatelessWidget {
//   const EditIconButton({
//     Key? key,
//     this.onPressed,
//     this.iconData,
//   }) : super(key: key);

//   final void Function()? onPressed;
//   final IconData? iconData;
//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: Align(
//         alignment: Alignment.center,
//         child: RoundeIconButton(
//           onPressed: onPressed,
//           backgroundColor: Cr.accentBlue1,
//           icon: Icon(
//             iconData ?? Icons.edit,
//             color: Cr.whiteColor,
//           ),
//         ),
//       ),
//     );
//   }
// }

