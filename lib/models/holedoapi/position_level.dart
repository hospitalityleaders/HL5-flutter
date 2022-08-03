import 'package:holedo/models/models.dart';

import 'join_data.dart';

class PositionLevel extends Model {
  int? id;
  String? title;
  String? description;
  JoinDataModel? joinDataModel;

  PositionLevel({this.id, this.title, this.description, this.joinDataModel});

  factory PositionLevel.fromJson(Map<String, dynamic> json) => PositionLevel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        joinDataModel: json['_joinDataModel'] == null
            ? null
            : JoinDataModel.fromJson(
                json['_joinDataModel'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        '_joinDataModel': joinDataModel?.toJson(),
      };
}
