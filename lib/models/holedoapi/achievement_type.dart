import 'package:holedo/models/models.dart';

class AchievementType extends Model {
  int? id;
  String? title;

  AchievementType({this.id, this.title});

  factory AchievementType.fromJson(Map<String, dynamic> json) {
    return AchievementType(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
