import 'package:holedo/models/models.dart';

class Headline extends Model {
  String? widget;
  String? blockType;
  String? centerColumns;
  String? widgetLeft;
  String? widgetRight;
  String? widgetCenterLeft;
  String? widgetCenterRight;

  Headline({
    this.widget,
    this.blockType,
    this.centerColumns,
    this.widgetLeft,
    this.widgetRight,
    this.widgetCenterLeft,
    this.widgetCenterRight,
  });

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        widget: json['Widget'] as String?,
        blockType: json['block_type'] as String?,
        centerColumns: json['center_columns'] as String?,
        widgetLeft: json['widget_left'] as String?,
        widgetRight: json['widget_right'] as String?,
        widgetCenterLeft: json['widget_center_left'] as String?,
        widgetCenterRight: json['widget_center_right'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Widget': widget,
        'block_type': blockType,
        'center_columns': centerColumns,
        'widget_left': widgetLeft,
        'widget_right': widgetRight,
        'widget_center_left': widgetCenterLeft,
        'widget_center_right': widgetCenterRight,
      };
}
