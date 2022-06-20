import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/profile_reference_single_compoenet.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_columns/page_overview_third_columns.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class ReferenceSection extends StatefulWidget {
  const ReferenceSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ReferenceSection> createState() => _ReferenceSectionState();
}

class _ReferenceSectionState extends State<ReferenceSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Di.getScreenSize(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHOTL,
          SizedBox(
            width: 360,
            // height: 220,
            child: Column(
              children: [
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                // Di.DD,
              ],
            ),
          ),
          Di.SBHOTL,
          SizedBox(
            width: 360,
            // height: 220,
            child: Column(
              children: [
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(
                  description:
                      "exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                ),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                ProfileReferenceSingleComponent(),
                // Di.DD,
              ],
            ),
          ),
          Di.SBWEL,
          ProfileOverviewThirdColumn(),
          Di.SBWEL,
        ],
      ),
    );
  }
}
