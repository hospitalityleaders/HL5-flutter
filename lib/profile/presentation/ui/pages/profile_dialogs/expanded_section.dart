import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;

  const ExpandedSection({
    Key? key,
    this.expand = false,
    required this.child,
  }) : super(key: key);

  @override
  State<ExpandedSection> createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection> {
  @override
  Widget build(BuildContext context) {
    return widget.expand ? widget.child : Di.ESB;
  }
}

// class ExpandedSection extends StatefulWidget {
//   final Widget child;
//   final bool expand;
//   ExpandedSection({
//     this.expand = false,
//     required this.child,
//   });

//   @override
//   _ExpandedSectionState createState() => _ExpandedSectionState();
// }

// class _ExpandedSectionState extends State<ExpandedSection>
//     with SingleTickerProviderStateMixin {
//   late AnimationController expandController;
//   late Animation<double> animation;
//   bool showNothing = false;

//   @override
//   void initState() {
//     super.initState();
//     prepareAnimations();
//     _runExpandCheck();

//     expandController.addListener(() {
//       _runExpandCheck();
//     });
//   }

//   void prepareAnimations() {
//     expandController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//     animation = CurvedAnimation(
//       parent: expandController,
//       curve: Curves.fastOutSlowIn,
//     );
//   }

//   void _runExpandCheck() {
//     if (widget.expand) {
//       setState(() {
//         showNothing = false;
//       });
//       expandController.forward();
//     } else {
//       expandController.reverse();
//       if (!expandController.isAnimating || expandController.isCompleted) {
//         setState(() {
//           showNothing = true;
//         });
//       }
//     }
//   }

//   @override
//   void didUpdateWidget(ExpandedSection oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _runExpandCheck();
//   }

//   @override
//   void dispose() {
//     expandController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizeTransition(
//       axisAlignment: 1.0,
//       sizeFactor: animation,
//       // child: widget.child,
//       child: showNothing ? Di.ESB : widget.child,
//       // child: (expandController.isAnimating && widget.expand)
//       //     ? widget.child
//       //     : Di.ESB,
//     );
//   }
// }
