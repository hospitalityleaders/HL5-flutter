class LanguageProficiencyType {
  int? id;
  String? title;

  LanguageProficiencyType({this.id, this.title});

  factory LanguageProficiencyType.fromJson(Map<String, dynamic> json) {
    return LanguageProficiencyType(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
