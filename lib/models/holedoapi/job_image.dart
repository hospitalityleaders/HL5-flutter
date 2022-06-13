class JobImage {
  int? id;
  int? jobId;
  String? url;
  DateTime? created;
  DateTime? modified;

  JobImage({this.id, this.jobId, this.url, this.created, this.modified});

  factory JobImage.fromJson(Map<String, dynamic> json) => JobImage(
        id: json['id'] as int?,
        jobId: json['job_id'] as int?,
        url: json['url'] as String?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'job_id': jobId,
        'url': url,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
      };
}
