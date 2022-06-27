import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileMyReferenceDialogWidget extends StatefulWidget {
  const ProfileMyReferenceDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileMyReferenceDialogWidget> createState() =>
      _ProfileWriteReferenceDialogWidgetState();
}

class _ProfileWriteReferenceDialogWidgetState
    extends State<ProfileMyReferenceDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.darkGrey4,
      width: 655,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogTitleWidget(
            title: "My reference",
          ),
          Di.SBHL,
          Center(
            child: SizedBox(
              width: 615,
              child: Text(
                "Select from your references below which ones you would like to display on your profile overview. You can display up to two references to show on your profile overview.",
                textAlign: TextAlign.center,
                style: bodyLarge.copyWith(
                  height: 1.375,
                  color: Cr.darkGrey1,
                ),
              ),
            ),
          ),
          Di.SBHL,
          DialogExpandedTile(isExpanded: true),
          DialogExpandedTile(),
          Di.SBHD,
        ],
      ),
    );
  }
}

class DialogExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const DialogExpandedTile({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<DialogExpandedTile> createState() => _DialogExpandedTileState();
}

class _DialogExpandedTileState extends State<DialogExpandedTile> {
  List<String> newTextField = [""];
  String? selectedValue;
  bool currentlyWorkHere = false;

  late ExpandedTileController expandedTileController;
  @override
  void initState() {
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    super.initState();
  }

  @override
  void dispose() {
    expandedTileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Di.PSL),
      width: 615,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Ealasiad Wang',
                  style: h4Bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2, left: 8),
                  child: Text(
                    'MHL',
                    style: dividerTextSmall,
                  ),
                ),
              ],
            ),
            Text(
              "Recruiter, Top Talent Recruiters",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            expandedTileController = expandedTileController.copyWith(
              isExpanded: !expandedTileController.isExpanded,
            );
          });
        },
        leading: Container(
          width: 50,
          height: 50,
          color: Cr.grey1,
        ),
        trailingRotation: 0,
        trailing: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Cr.accentBlue3,
            borderRadius: BorderRadius.circular(16),
          ),
          child: expandedTileController.isExpanded
              ? null
              : Icon(
                  Icons.check,
                  color: Cr.accentBlue1,
                  size: 20,
                ),
        ),
        //  isExpanded
        //     ? SizedBox(
        //         width: 16,
        //         height: 16,
        //         child: Center(
        //           child: Container(
        //             width: 9.5,
        //             height: 1.5,
        //             color: Cr.accentBlue1,
        //           ),
        //         ),
        //       )
        //     : Icon(
        //         FontAwesomeIcons.pencil,
        //         color: Cr.accentBlue1,
        //         size: 16,
        //       ),
        theme: ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          color: Cr.lightGrey2,
          padding: EdgeInsets.only(
            left: Di.PSL,
            right: Di.PSL,
            top: 12,
            bottom: Di.PSD,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                """Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
                  
Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.""",
                style: bodyLarge.copyWith(
                  color: Cr.darkGrey1,
                ),
              ),
              Di.SBHS,
              GestureDetector(
                child: Row(
                  children: [
                    CustomMinusIcon(
                      widthHeight: 12,
                      minusWidth: 7,
                    ),
                    Di.SBWES,
                    Text(
                      "Hide reference",
                      style: bodySmallRegular.copyWith(
                        color: Cr.accentBlue1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
