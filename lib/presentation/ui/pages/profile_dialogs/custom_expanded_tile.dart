import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holedo/presentation/ui/components/onhover.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/images.dart';

class CustomExpandedTileController extends ChangeNotifier {
  bool _isExpanded;

  bool get isExpanded => _isExpanded;
  set _setExpanded(bool ex) {
    _isExpanded = ex;
    notifyListeners();
  }

  CustomExpandedTileController({
    int? key,
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
  ////? Header
  final Color? headerColor;
  final Color? headerSplashColor;
  final EdgeInsetsGeometry? headerPadding;
  final double? headerRadius;
  // leading
  final EdgeInsetsGeometry? leadingPadding;
  // title
  final EdgeInsetsGeometry? titlePadding;
  // trailing
  final EdgeInsetsGeometry? trailingPadding;
  ////? Content
  final Color? contentBackgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? contentRadius;
  const CustomExpandedTileThemeData({
    key,
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
    final Widget? leading, // default is none
// Title
    final Widget? title, // required
// Trailing
    final Widget? trailing, // default is chevron icon
    final double? trailingRotation, // default is 90
////? Content
    final Widget? content, // required
    final double? contentSeperator, // default is 6.0
////? Misc
    final bool? enabled,
    final CustomExpandedTileThemeData? theme, // default themedata
    final CustomExpandedTileController? controller, // required
    final Curve? expansionAnimationCurve, // default is ease
    final Duration? expansionDuration, // default is 200ms
    final VoidCallback? onTap,
    final VoidCallback? onLongTap,
  }) {
    return CustomExpandedTile(
      key: key,
////? Header
// Leading
      leading: leading ?? this.leading,
// Title
      title: title ?? this.title,
// Trailing
      trailing: trailing ?? this.trailing,
      trailingRotation: trailingRotation ?? this.trailingRotation,
////? Content
      content: content ?? this.content,
      contentSeperator: contentSeperator ?? this.contentSeperator,
////? Misc
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
  _CustomExpandedTileState createState() => _CustomExpandedTileState();
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
    // tileController.dispose();
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
          child: OnHover(builder: (isHovered) {
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
                  widget.leading != null
                      ? Padding(
                          padding: widget.theme!.leadingPadding!,
                          child: widget.leading,
                        )
                      : Container(),
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
          }),
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

enum TileListConstructor {
  builder,
  seperated,
}

typedef CustomExpandedTileBuilder = CustomExpandedTile Function(
    BuildContext context, int index, CustomExpandedTileController controller);

/// An extension of the listview returning a list of [CustomExpandedTile] widgets which are
/// Expansion tile similar to the list tile supports leading widget,
/// Trailing widget and programatic control with content expansion animation.
///
///
/// This ListView also supports seperate controllers for each tile with seperate programatic controls.
///
///
/// Available constructors right now: [ExpandedListTile.builder()] , [ExpandedListTile.seperated()]
///
///
/// P.S : Supplied Controllers are overlooked in the [CustomExpandedTileList] builder widget, supply a new or initialized controller, it doesn't matter!
///
/// {@tool snippet}
///
/// ```dart
/// CustomExpandedTileList.builder(
///  itemCount: 7,
///  maxOpened: 2,
///   itemBuilder: (context, index, controller) {
///     return CustomExpandedTile(
///       controller:controller,
///       onTap: (){
///       },
///       onLongTap: (){
///       },
///       theme: CustomExpandedTileThemeData(),
///       title:
///       content:
///       ...
///   }
/// )
///
/// ```
/// {@end-tool}
class CustomExpandedTileList extends StatefulWidget {
  final bool reverse;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final CustomExpandedTileBuilder itemBuilder;
  final IndexedWidgetBuilder? seperatorBuilder;
  final int itemCount;
  final String? restorationId;
  final int maxOpened;
  final TileListConstructor _constructor;

  const CustomExpandedTileList.builder({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding,
    this.physics,
    this.restorationId,
    this.reverse = false,
    this.shrinkWrap = true,
    this.maxOpened = 1,
  })  : assert(itemCount != 0),
        assert(maxOpened != 0),
        _constructor = TileListConstructor.builder,
        seperatorBuilder = null,
        super(key: key);

  const CustomExpandedTileList.seperated({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.seperatorBuilder,
    this.padding,
    this.physics,
    this.restorationId,
    this.reverse = false,
    this.shrinkWrap = true,
    this.maxOpened = 1,
  })  : assert(itemCount != 0),
        assert(maxOpened != 0),
        _constructor = TileListConstructor.seperated,
        super(key: key);

  @override
  _CustomExpandedTileListState createState() => _CustomExpandedTileListState();
}

class _CustomExpandedTileListState extends State<CustomExpandedTileList> {
  late List<CustomExpandedTileController> tileControllers;
  late List<CustomExpandedTileController> openedTilesControllers;
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    tileControllers = List.generate(
      widget.itemCount,
      (index) => CustomExpandedTileController(key: index),
    );
    openedTilesControllers = [];
  }

  @override
  Widget build(BuildContext context) {
    return widget._constructor == TileListConstructor.builder
        ? ListView.builder(
            shrinkWrap: widget.shrinkWrap,
            controller: scrollController,
            itemCount: widget.itemCount,
            reverse: widget.reverse,
            physics: widget.physics,
            padding: widget.padding,
            itemBuilder: (context, index) {
              return widget
                  .itemBuilder(
                    context,
                    index,
                    tileControllers[index],
                  )
                  .copyWith(
                      controller: tileControllers[index],
                      onTap: !widget
                              .itemBuilder(
                                context,
                                index,
                                tileControllers[index],
                              )
                              .enabled
                          ? () {}
                          : () {
                              int openedTiles = openedTilesControllers.length;
                              if (tileControllers[index].isExpanded) {
                                if (openedTiles == widget.maxOpened) {
                                  openedTilesControllers.last.collapse();
                                  openedTilesControllers
                                      .remove(openedTilesControllers.last);
                                }
                                openedTilesControllers
                                    .add(tileControllers[index]);
                              } else {
                                openedTilesControllers
                                    .remove(tileControllers[index]);
                              }
                            });
            },
          )
        : ListView.separated(
            shrinkWrap: widget.shrinkWrap,
            controller: scrollController,
            itemCount: widget.itemCount,
            reverse: widget.reverse,
            physics: widget.physics,
            padding: widget.padding,
            separatorBuilder: (context, index) {
              return widget.seperatorBuilder!(
                context,
                index,
              );
            },
            itemBuilder: (context, index) {
              return widget
                  .itemBuilder(
                    context,
                    index,
                    tileControllers[index],
                  )
                  .copyWith(
                      controller: tileControllers[index],
                      onTap: !widget
                              .itemBuilder(
                                context,
                                index,
                                tileControllers[index],
                              )
                              .enabled
                          ? () {}
                          : () {
                              int openedTiles = openedTilesControllers.length;
                              if (tileControllers[index].isExpanded) {
                                if (openedTiles == widget.maxOpened) {
                                  openedTilesControllers.last.collapse();
                                  openedTilesControllers
                                      .remove(openedTilesControllers.last);
                                }
                                openedTilesControllers
                                    .add(tileControllers[index]);
                              } else {
                                openedTilesControllers
                                    .remove(tileControllers[index]);
                              }
                            });
            },
          );
  }
}
