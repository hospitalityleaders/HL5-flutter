import 'package:holedo/models/models.dart';

class CategoryTypeA extends Model {
  String? widgets;
  String? widgetCenterRight;
  String? widgetCenterLeft;
  String? widgetRight;
  String? widgetLeft;
  String? centerColumns;
  String? blockType;

  CategoryTypeA({
    this.widgets,
    this.widgetCenterRight,
    this.widgetCenterLeft,
    this.widgetRight,
    this.widgetLeft,
    this.centerColumns,
    this.blockType,
  });

  factory CategoryTypeA.fromJson(Map<String, dynamic> json) => CategoryTypeA(
        widgets: json['Widgets'] as String?,
        widgetCenterRight: json['widget_center_right'] as String?,
        widgetCenterLeft: json['widget_center_left'] as String?,
        widgetRight: json['widget_right'] as String?,
        widgetLeft: json['widget_left'] as String?,
        centerColumns: json['center_columns'] as String?,
        blockType: json['block_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Widgets': widgets,
        'widget_center_right': widgetCenterRight,
        'widget_center_left': widgetCenterLeft,
        'widget_right': widgetRight,
        'widget_left': widgetLeft,
        'center_columns': centerColumns,
        'block_type': blockType,
      };
}
