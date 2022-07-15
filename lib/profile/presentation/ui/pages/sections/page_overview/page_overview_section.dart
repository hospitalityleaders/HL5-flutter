import 'package:flutter/material.dart';

class PageOverviewSection extends StatefulWidget {
  final bool isEditable;

  final VoidCallback? editProfileBtn;

  const PageOverviewSection({
    required this.isEditable,
    this.editProfileBtn,
    Key? key,
  }) : super(key: key);

  @override
  State<PageOverviewSection> createState() => _PageOverviewSectionState();
}

class _PageOverviewSectionState extends State<PageOverviewSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Flexible(
          //   child: ProfileOverviewFirstColumn(),
          // ),
          // Di.SBWEL,
          // Flexible(
          //   child: ProfileOverviewSecondColumn(),
          // ),
          // Di.SBWEL,
          // Flexible(
          //   child: ProfileOverviewThirdColumn(),
          // ),
          // Di.SBWEL,
        ],
      ),
    );
  }
}
