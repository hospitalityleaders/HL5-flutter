import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
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
  final GlobalKey _widgetKey = GlobalKey();

  void _getScreenSize() {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox
        .size; // or _widgetKey.currentContext?.size    print('Size: ${size.width}, ${size.height}');
  }

  @override
  void didUpdateWidget(covariant ReferenceSection oldWidget) {
    _getScreenSize();
    super.didUpdateWidget(oldWidget);
  }
  // @override
  // void didChangeDependencies() {
  //   _getScreenSize();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Di.getScreenSize(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBCW(70),
          SizedBox(
            key: _widgetKey,
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
          Di.SBWEL,
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
          ProfileOverviewThirdColumn(
            userProfileData: DbData.getUserProfileData,
          ),
          Di.SBCW(70),
        ],
      ),
    );
  }
}
