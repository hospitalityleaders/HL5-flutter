class Timeline {
  Timeline({
    this.id,
    this.title,
    this.type,
    this.dateFrom,
    this.dateTo,
  });

  final int? id;
  final String? title;
  final String? type;
  final DateTime? dateFrom;
  final DateTime? dateTo;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        id: json["id"] as int?,
        title: json["title"] as String?,
        type: json["type"] as String?,
        dateFrom: json["date_from"] == null
            ? null
            : DateTime.parse(json["date_from"] as String),
        dateTo: json["date_to"] == null
            ? null
            : DateTime.parse(json["date_to"] as String),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "date_from": dateFrom == null
            ? null
            : "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
        "date_to": dateTo == null
            ? null
            : "${dateTo!.year.toString().padLeft(4, '0')}-${dateTo!.month.toString().padLeft(2, '0')}-${dateTo!.day.toString().padLeft(2, '0')}",
      };
}
