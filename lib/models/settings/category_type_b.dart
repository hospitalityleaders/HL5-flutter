class CategoryTypeB {
  String? backgroundColor;
  String? headerColor;
  String? widgetCenterRight;
  String? widgetCenterLeft;
  String? widgetRight;
  String? widgetLeft;
  String? centerColumns;
  String? blockType;

  CategoryTypeB({
    this.backgroundColor,
    this.headerColor,
    this.widgetCenterRight,
    this.widgetCenterLeft,
    this.widgetRight,
    this.widgetLeft,
    this.centerColumns,
    this.blockType,
  });

  factory CategoryTypeB.fromJson(Map<String, dynamic> json) => CategoryTypeB(
        backgroundColor: json['background_color'] as String?,
        headerColor: json['header_color'] as String?,
        widgetCenterRight: json['widget_center_right'] as String?,
        widgetCenterLeft: json['widget_center_left'] as String?,
        widgetRight: json['widget_right'] as String?,
        widgetLeft: json['widget_left'] as String?,
        centerColumns: json['center_columns'] as String?,
        blockType: json['block_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'background_color': backgroundColor,
        'header_color': headerColor,
        'widget_center_right': widgetCenterRight,
        'widget_center_left': widgetCenterLeft,
        'widget_right': widgetRight,
        'widget_left': widgetLeft,
        'center_columns': centerColumns,
        'block_type': blockType,
      };
}
