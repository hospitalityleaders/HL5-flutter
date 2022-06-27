import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_second_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/profile_overview_first_column.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class PageOverviewSection extends StatefulWidget {
  final isEditable;

  final User userProfileData;
  final VoidCallback? editProfileBtn;

  const PageOverviewSection({
    required this.isEditable,
    this.editProfileBtn,
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  @override
  State<PageOverviewSection> createState() => _PageOverviewSectionState();
}

class _PageOverviewSectionState extends State<PageOverviewSection> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ProfileOverviewFirstColumn(
                sec1IsEditable: widget.isEditable,
                userProfileData: widget.userProfileData,
              ),
            ),
            Di.SBWEL,
            Flexible(
              child: ProfileOverviewSecondColumn(
                sec2IsEditable: widget.isEditable,
                userProfileData: widget.userProfileData,
              ),
            ),
            Di.SBWEL,
            Flexible(
              child: ProfileOverviewThirdColumn(
                userProfileData: widget.userProfileData,
              ),
            ),
            Di.SBWEL,
          ],
        ),
      ),
    );
  }
}
