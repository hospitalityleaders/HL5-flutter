class Category {
  String? widgetCenterRight;
  String? widgetCenterLeft;
  String? widgetRight;
  String? widgetLeft;
  String? centerColumns;
  String? blockType;

  Category({
    this.widgetCenterRight,
    this.widgetCenterLeft,
    this.widgetRight,
    this.widgetLeft,
    this.centerColumns,
    this.blockType,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        widgetCenterRight: json['widget_center_right'] as String?,
        widgetCenterLeft: json['widget_center_left'] as String?,
        widgetRight: json['widget_right'] as String?,
        widgetLeft: json['widget_left'] as String?,
        centerColumns: json['center_columns'] as String?,
        blockType: json['block_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'widget_center_right': widgetCenterRight,
        'widget_center_left': widgetCenterLeft,
        'widget_right': widgetRight,
        'widget_left': widgetLeft,
        'center_columns': centerColumns,
        'block_type': blockType,
      };
}
