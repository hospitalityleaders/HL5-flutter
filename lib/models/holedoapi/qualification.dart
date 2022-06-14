import 'join_data.dart';

class Qualification {
  int? id;
  String? title;
  JoinDataModel? joinDataModel;

  Qualification({this.id, this.title, this.joinDataModel});

  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
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
