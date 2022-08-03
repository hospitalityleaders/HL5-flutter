import 'package:holedo/models/models.dart';

class JobApplication extends Model {
  int? id;
  int? userId;
  int? jobId;
  String? coverLetter;
  DateTime? created;
  DateTime? modified;

  JobApplication({
    this.id,
    this.userId,
    this.jobId,
    this.coverLetter,
    this.created,
    this.modified,
  });

  factory JobApplication.fromJson(Map<String, dynamic> json) {
    return JobApplication(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      jobId: json['job_id'] as int?,
      coverLetter: json['cover_letter'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      modified: json['modified'] == null
          ? null
          : DateTime.parse(json['modified'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'job_id': jobId,
        'cover_letter': coverLetter,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
      };
}
