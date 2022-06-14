class UserTitleType {
  int? id;
  String? title;

  UserTitleType({this.id, this.title});

  factory UserTitleType.fromJson(Map<String, dynamic> json) => UserTitleType(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
