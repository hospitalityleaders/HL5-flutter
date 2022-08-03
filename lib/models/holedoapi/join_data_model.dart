import 'package:holedo/models/models.dart';

class JoinData extends Model {
  int? id;
  int? userId;
  int? userTagId;

  JoinData({this.id, this.userId, this.userTagId});

  factory JoinData.fromJson(Map<String, dynamic> json) => JoinData(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        userTagId: json['user_tag_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'user_tag_id': userTagId,
      };
}
