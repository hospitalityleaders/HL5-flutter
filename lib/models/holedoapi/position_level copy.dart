class PositionLevel {
  int? id;
  String? title;
  String? description;

  PositionLevel({this.id, this.title, this.description});

  factory PositionLevel.fromJson(Map<String, dynamic> json) => PositionLevel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
