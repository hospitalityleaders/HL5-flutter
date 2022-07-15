import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:routemaster/routemaster.dart';
import 'package:video_player/video_player.dart';

class ProfileFeaturedVideoDialogWidget extends StatefulWidget {
  const ProfileFeaturedVideoDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileFeaturedVideoDialogWidget> createState() =>
      _ProfileWriteReferenceDialogWidgetState();
}

class _ProfileWriteReferenceDialogWidgetState
    extends State<ProfileFeaturedVideoDialogWidget> {
  @override
  Widget build(BuildContext context) {
    final userProfileData = DbData.getUserProfileData;

    return SingleChildScrollView(
      child: Container(
        color: Cr.darkGrey4,
        width: 655,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DialogTitleWidget(
              title: "Featured video",
            ),
            Di.SBHL,
            _CoverDialogExpandedTile(
              isExpanded: true,
              userProfileData: userProfileData,
            ),
            Di.SBHD,
          ],
        ),
      ),
    );
  }
}

class _CoverDialogExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const _CoverDialogExpandedTile({
    Key? key,
    this.isExpanded = false,
    required this.userProfileData,
  }) : super(key: key);
  final User userProfileData;
  @override
  State<_CoverDialogExpandedTile> createState() =>
      __CoverDialogExpandedTileState();
}

class __CoverDialogExpandedTileState extends State<_CoverDialogExpandedTile> {
  late final TextEditingController _videoLinkController;
  late final TextEditingController _videoTitleController;
  late final TextEditingController _videoDescriptionController;
  VideoPlayerController? _videoPlayerController;

  final _formKey = GlobalKey<FormState>();

  String? selectedValue;
  bool currentlyWorkHere = false;
  late ExpandedTileController expandedTileController;
  @override
  void initState() {
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    _videoLinkController = TextEditingController(
      text: widget.userProfileData.profileVideoUrl,
    )..addListener(() {
        setState(() {});
        setState(() async {
          await Future.delayed(const Duration(milliseconds: 200));
          _videoPlayerController = VideoPlayerController.network(
            _videoLinkController.text,
          );
          _videoPlayerController!.initialize().then((value) {
            setState(() {});
          });
        });
      });
    _videoTitleController = TextEditingController(
      text: widget.userProfileData.profileVideoTitle,
    );
    _videoDescriptionController = TextEditingController(
      text: widget.userProfileData.profileVideoDescription,
    );
    if (widget.userProfileData.profileVideoUrl != null) {
      _videoPlayerController =
          VideoPlayerController.network(widget.userProfileData.profileVideoUrl!)
            ..addListener(() {
              if (_videoPlayerController!.value.position ==
                  _videoPlayerController!.value.duration) {
                setState(() {
                  _videoPlayerController!.pause();
                });
              }
            });
      _videoPlayerController!.initialize().then((value) {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }
    expandedTileController.dispose();
    _videoTitleController.dispose();
    _videoDescriptionController.dispose();
    _videoLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 615,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Featured video',
              style: h4Bold,
            ),
            Text(
              "Your featured video will be used on your profile.",
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
          color: Cr.accentBlue1,
          child: const Center(
            child: Icon(
              Icons.play_arrow,
              size: 22,
              color: Cr.whiteColor,
            ),
          ),
        ),
        trailingRotation: 0,
        trailing: !(expandedTileController.isExpanded == false)
            ? null
            : const CustomMinusIcon(),
        theme: const ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          color: Cr.whiteColor,
          padding: const EdgeInsets.only(
            // left: Di.PSL,
            // right: Di.PSL,
            top: 12,
            bottom: Di.PSD,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_videoPlayerController != null)
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 345,
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                      Center(
                        child: FloatingActionButton(
                          backgroundColor: Cr.accentBlue1,
                          onPressed: () {
                            setState(() {
                              _videoPlayerController!.value.isPlaying
                                  ? _videoPlayerController!.pause()
                                  : _videoPlayerController!.play();
                            });
                          },
                          child: Icon(
                            _videoPlayerController!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Di.ESB,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Di.SBHL,
                      const DialogLabelTextFormField(
                        customLabel: "Video link",
                      ),
                      Di.SBHES,
                      DialogTextFieldForm(
                        // validator: (vallue) {
                        //   return null;
                        //   // Validator.validateText(value);
                        // },
                        textEditingController: _videoLinkController,
                      ),
                      Di.SBCH(18),
                      const DialogLabelTextFormField(
                        customLabel: "Video title",
                      ),
                      Di.SBHES,
                      DialogTextFieldForm(
                        textEditingController: _videoTitleController,
                      ),
                      Di.SBCH(18),
                      const DialogLabelTextFormField(
                        customLabel: "Video description",
                      ),
                      Di.SBHES,
                      DialogMultiLineTextField(
                        textEditingController: _videoDescriptionController,
                        width: 575,
                      ),
                      Di.SBCH(28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomElevatedButton(
                            borderColor: Cr.accentBlue2,
                            makeWidthNull: true,
                            onPressed: () => Nav.pop(context),
                            height: 36,
                            donotShowIcon: true,
                            backgroundColor: Cr.accentBlue3,
                            child: Text(
                              "Cancel",
                              style: bodySmallRegular.copyWith(
                                color: Cr.accentBlue1,
                              ),
                            ),
                          ),
                          Di.SBWES,
                          CustomElevatedButton(
                            borderColor: Cr.accentBlue2,
                            makeWidthNull: true,
                            onPressed: () async {
                              showCircularProgressIndicator(context);
                              await User(
                                profileVideoTitle: _videoTitleController.text,
                                profileVideoUrl: _videoLinkController.text,
                                profileVideoDescription:
                                    _videoDescriptionController.text,
                              ).save(DbData.getUserProfileData);

                              Routemaster.of(context).push("/profile");
                              Nav.pop(context);
                              Nav.pop(context);
                              // }
                            },
                            height: 36,
                            donotShowIcon: true,
                            backgroundColor: Cr.accentBlue1,
                            child: Text(
                              "Add to profile",
                              style: bodySmallRegular.copyWith(
                                color: Cr.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
