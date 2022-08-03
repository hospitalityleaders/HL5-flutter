import 'package:holedo/models/models.dart';

class LinkedEmploymentType extends Model {
  int? id;
  String? title;

  LinkedEmploymentType({this.id, this.title});

  factory LinkedEmploymentType.fromJson(Map<String, dynamic> json) {
    return LinkedEmploymentType(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
