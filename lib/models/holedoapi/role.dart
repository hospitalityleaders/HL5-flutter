import 'package:holedo/models/models.dart';

class Role extends Model {
  int? id;
  String? title;

  Role({this.id, this.title});

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
