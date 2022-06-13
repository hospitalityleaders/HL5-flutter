import 'join_data.dart';

class Language {
  int? id;
  String? title;
  JoinDataModel? joinDataModel;

  Language({this.id, this.title, this.joinDataModel});

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json['id'] as int?,
        title: json['title'] as String?,
        joinDataModel: json['_joinDataModel'] == null
            ? null
            : JoinDataModel.fromJson(
                json['_joinDataModel'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        '_joinDataModel': joinDataModel?.toJson(),
      };
}
