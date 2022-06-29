// class Language {
//   int? id;
//   String? title;
//   JoinDataModel? joinDataModel;

//   Language({this.id, this.title, this.joinDataModel});

//   factory Language.fromJson(Map<String, dynamic> json) => Language(
//         id: json['id'] as int?,
//         title: json['title'] as String?,
//         joinDataModel: json['_joinDataModel'] == null
//             ? null
//             : JoinDataModel.fromJson(
//                 json['_joinDataModel'] as Map<String, dynamic>),
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'title': title,
//         '_joinDataModel': joinDataModel?.toJson(),
//       };
// }

class Language {
  Language({
    this.id,
    this.title,
    this.joinData,
  });

  final int? id;
  final String? title;
  final LanguageJoinData? joinData;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"] as int,
        title: json["title"] as String,
        joinData: LanguageJoinData.fromJson(
            json["_joinData"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "_joinData": joinData?.toJson(),
      };
}

class LanguageJoinData {
  LanguageJoinData({
    this.id,
    this.userId,
    this.languageId,
    this.languageProficiencyTypeId,
  });

  final int? id;
  final int? userId;
  final int? languageId;
  final int? languageProficiencyTypeId;

  factory LanguageJoinData.fromJson(Map<String, dynamic> json) =>
      LanguageJoinData(
        id: json["id"] as int,
        userId: json["user_id"] as int,
        languageId: json["language_id"] as int,
        languageProficiencyTypeId: json["language_proficiency_type_id"] as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "language_id": languageId,
        "language_proficiency_type_id": languageProficiencyTypeId,
      };
}
