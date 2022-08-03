import 'package:holedo/models/models.dart';

import 'join_data_model.dart';

class Expertise extends Model {
  int? id;
  String? title;
  int? featured;
  String? created;
  String? modified;
  JoinData? joinData;

  Expertise({
    this.id,
    this.title,
    this.featured,
    this.created,
    this.modified,
    this.joinData,
  });

  factory Expertise.fromJson(Map<String, dynamic> json) => Expertise(
        id: json['id'] as int?,
        title: json['title'] as String?,
        featured: json['featured'] as int?,
        created: json['created'] as String?,
        modified: json['modified'] as String?,
        joinData: json['_joinData'] == null
            ? null
            : JoinData.fromJson(json['_joinData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'featured': featured,
        'created': created,
        'modified': modified,
        '_joinData': joinData?.toJson(),
      };

  Expertise copyWith({
    int? id,
    String? title,
    int? featured,
    String? created,
    String? modified,
    JoinData? joinData,
  }) {
    return Expertise(
      id: id ?? this.id,
      title: title ?? this.title,
      featured: featured ?? this.featured,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      joinData: joinData ?? this.joinData,
    );
  }
}
