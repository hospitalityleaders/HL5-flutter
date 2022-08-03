import 'package:holedo/models/models.dart';

class EmploymentDuration extends Model {
  int? id;
  String? title;

  EmploymentDuration({this.id, this.title});

  factory EmploymentDuration.fromJson(Map<String, dynamic> json) {
    return EmploymentDuration(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
