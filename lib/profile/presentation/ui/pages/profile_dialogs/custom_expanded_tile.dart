import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/profile/presentation/ui/components/onhover.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/images.dart';

class CustomExpandedTileController extends ChangeNotifier {
  bool _isExpanded;

  bool get isExpanded => _isExpanded;
  set _setExpanded(bool ex) {
    _isExpanded = ex;
    notifyListeners();
  }

  CustomExpandedTileController({
    bool isExpanded = false,
  }) : _isExpanded = isExpanded;

  void expand() {
    _setExpanded = true;
    notifyListeners();
  }

  void collapse() {
    _setExpanded = false;
    notifyListeners();
  }

  void toggle() {
    _setExpanded = !isExpanded;
    notifyListeners();
  }
}

class CustomExpandedTileThemeData {
  final Color? headerColor;
  final Color? headerSplashColor;
  final EdgeInsetsGeometry? headerPadding;
  final double? headerRadius;
  final EdgeInsetsGeometry? leadingPadding;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? trailingPadding;
  final Color? contentBackgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? contentRadius;
  const CustomExpandedTileThemeData({
    this.headerColor = const Color(0xfffafafa),
    this.headerSplashColor = const Color(0xffeeeeee),
    this.headerPadding = const EdgeInsets.all(16.0),
    this.headerRadius = 8.0,
    this.leadingPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 12.0),
    this.trailingPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.contentBackgroundColor = const Color(0xffeeeeee),
    this.contentPadding = const EdgeInsets.all(16.0),
    this.contentRadius = 8.0,
  });
}

class CustomExpandedTile extends StatefulWidget {
  final Widget? leading; // default is none
  final Widget title; // required
  final Widget? trailing; // default is chevron icon
  final double? trailingRotation; // default is 90
  final Widget content; // required
  final double? contentSeperator; // default is 6.0
  final bool enabled;
  final CustomExpandedTileThemeData? theme; // default themedata
  final CustomExpandedTileController controller; // required
  final Curve? expansionAnimationCurve; // default is ease
  final Duration? expansionDuration; // default is 200ms
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  const CustomExpandedTile({
    Key? key,
    this.leading,
    required this.title,
    this.trailing = const Icon(Icons.chevron_right),
    this.trailingRotation = 90,
    required this.content,
    this.contentSeperator = 6.0,
    this.enabled = true,
    this.theme = const CustomExpandedTileThemeData(),
    required this.controller,
    this.expansionAnimationCurve = Curves.ease,
    this.expansionDuration = const Duration(milliseconds: 200),
    this.onTap,
    this.onLongTap,
  }) : super(key: key);

  CustomExpandedTile copyWith({
    final Widget? leading,
    final Widget? title,
    final Widget? trailing,
    final double? trailingRotation,
    final Widget? content,
    final double? contentSeperator,
    final bool? enabled,
    final CustomExpandedTileThemeData? theme,
    final CustomExpandedTileController? controller,
    final Curve? expansionAnimationCurve,
    final Duration? expansionDuration,
    final VoidCallback? onTap,
    final VoidCallback? onLongTap,
  }) {
    return CustomExpandedTile(
      key: key,
      leading: leading ?? this.leading,
      title: title ?? this.title,
      trailing: trailing ?? this.trailing,
      trailingRotation: trailingRotation ?? this.trailingRotation,
      content: content ?? this.content,
      contentSeperator: contentSeperator ?? this.contentSeperator,
      enabled: enabled ?? this.enabled,
      controller: controller ?? this.controller,
      theme: theme ?? this.theme,
      expansionDuration: expansionDuration ?? this.expansionDuration,
      expansionAnimationCurve:
          expansionAnimationCurve ?? this.expansionAnimationCurve,
      onTap: onTap ?? this.onTap,
      onLongTap: onLongTap ?? this.onLongTap,
      // Misc
    );
  }

  @override
  State<CustomExpandedTile> createState() => _CustomExpandedTileState();
}

class _CustomExpandedTileState extends State<CustomExpandedTile>
    with SingleTickerProviderStateMixin {
  late CustomExpandedTileController tileController;
  late bool _isExpanded;
  @override
  void initState() {
    tileController = widget.controller;
    _isExpanded = tileController.isExpanded;
    tileController.addListener(() {
      if (mounted) {
        setState(() {
          _isExpanded = widget.controller.isExpanded;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tileController.dispose();
    super.dispose();
  }

  double angleToRad(double angle) {
    return angle * 0.0174533;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //* Header
        GestureDetector(
          onTap: !widget.enabled
              ? () {}
              : () {
                  tileController.toggle();
                  if (widget.onTap != null) {
                    return widget.onTap!();
                  }
                },
          onLongPress: !widget.enabled
              ? () {}
              : () {
                  if (widget.onLongTap != null) {
                    return widget.onLongTap!();
                  }
                },
          child: OnHover(
            builder: (isHovered) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(widget.theme!.headerRadius!),
                  color: isHovered ? Cr.accentBlue3 : Cr.whiteColor,
                ),
                padding: widget.theme!.headerPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (widget.leading != null)
                      Padding(
                        padding: widget.theme!.leadingPadding!,
                        child: widget.leading,
                      )
                    else
                      Container(),
                    Expanded(
                      child: Container(
                        padding: widget.theme!.titlePadding,
                        child: widget.title,
                      ),
                    ),
                    Padding(
                      padding: widget.theme!.trailingPadding!,
                      child: _isExpanded
                          ? SvgPicture.asset(
                              Svgs.minus,
                              width: 16,
                              color: Cr.accentBlue1,
                            )
                          : isHovered
                              ? SvgPicture.asset(
                                  Svgs.pencil,
                                  width: 16,
                                  color: Cr.accentBlue1,
                                )
                              : null,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        //* Content
        AnimatedSize(
          duration: widget.expansionDuration!,
          curve: widget.expansionAnimationCurve!,
          child: Container(
            child: !_isExpanded
                ? null
                : Container(
                    decoration: BoxDecoration(
                      color: widget.theme!.contentBackgroundColor,
                      borderRadius:
                          BorderRadius.circular(widget.theme!.contentRadius!),
                    ),
                    padding: widget.theme!.contentPadding,
                    width: double.infinity,
                    child: widget.content,
                  ),
          ),
        ),
      ],
    );
  }
}
