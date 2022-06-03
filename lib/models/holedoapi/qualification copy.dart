class Qualification {
  int? id;
  String? title;

  Qualification({this.id, this.title});

  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
