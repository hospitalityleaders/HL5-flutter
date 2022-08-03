import 'package:holedo/models/models.dart';

import 'join_data_model.dart';

class UserTag extends Model {
  int? id;
  int? companyId;
  String? name;
  DateTime? created;
  DateTime? modified;
  JoinData? joinData;

  UserTag({
    this.id,
    this.companyId,
    this.name,
    this.created,
    this.modified,
    this.joinData,
  });

  factory UserTag.fromJson(Map<String, dynamic> json) => UserTag(
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        name: json['name'] as String?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        joinData: json['_joinData'] == null
            ? null
            : JoinData.fromJson(json['_joinData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_id': companyId,
        'name': name,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        '_joinData': joinData?.toJson(),
      };
}
