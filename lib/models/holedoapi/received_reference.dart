import 'package:holedo/models/models.dart';

class ReceivedReference extends Model {
  ReceivedReference({
    this.id,
    this.userId,
    this.authorId,
    this.testimonial,
    this.requestMessage,
    this.modificationMessage,
    this.status,
    this.created,
    this.modified,
  });

  final int? id;
  final int? userId;
  final int? authorId;
  final String? testimonial;
  final dynamic requestMessage;
  final dynamic modificationMessage;
  final int? status;
  final DateTime? created;
  final DateTime? modified;

  factory ReceivedReference.fromJson(Map<String, dynamic> json) =>
      ReceivedReference(
        id: json["id"] as int?,
        userId: json["user_id"] as int?,
        authorId: json["author_id"] as int?,
        testimonial: json["testimonial"] as String?,
        requestMessage: json["request_message"],
        modificationMessage: json["modification_message"],
        status: json["status"] as int?,
        created: DateTime.parse(json["created"] as String),
        modified: DateTime.parse(json["modified"] as String),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "author_id": authorId,
        "testimonial": testimonial,
        "request_message": requestMessage,
        "modification_message": modificationMessage,
        "status": status,
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
      };
}
