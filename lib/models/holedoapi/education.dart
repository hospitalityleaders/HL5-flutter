import 'country.dart';
import 'qualification.dart';

class Education {
  int? id;
  int? userId;
  int? countryId;
  int? qualificationId;
  String? title;
  dynamic logo;
  dynamic website;
  String? institution;
  String? area;
  DateTime? durationFromDate;
  DateTime? durationToDate;
  dynamic currentEducation;
  String? description;
  String? qualificationTypeTitle;
  DateTime? created;
  DateTime? modified;
  Qualification? qualification;
  Country? country;
  String? studyDuration;

  Education({
    this.id,
    this.userId,
    this.countryId,
    this.qualificationId,
    this.title,
    this.logo,
    this.website,
    this.institution,
    this.area,
    this.durationFromDate,
    this.durationToDate,
    this.currentEducation,
    this.description,
    this.qualificationTypeTitle,
    this.created,
    this.modified,
    this.qualification,
    this.country,
    this.studyDuration,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        countryId: json['country_id'] as int?,
        qualificationId: json['qualification_id'] as int?,
        title: json['title'] as String?,
        logo: json['logo'] as dynamic,
        website: json['website'] as dynamic,
        institution: json['institution'] as String?,
        area: json['area'] as String?,
        durationFromDate: json['duration_from_date'] == null
            ? null
            : DateTime.parse(json['duration_from_date'] as String),
        durationToDate: json['duration_to_date'] == null
            ? null
            : DateTime.parse(json['duration_to_date'] as String),
        currentEducation: json['current_education'] as dynamic,
        description: json['description'] as String?,
        qualificationTypeTitle: json['qualification_type_title'] as String?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        qualification: json['qualification'] == null
            ? null
            : Qualification.fromJson(
                json['qualification'] as Map<String, dynamic>),
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        studyDuration: json['study_duration'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'country_id': countryId,
        'qualification_id': qualificationId,
        'title': title,
        'logo': logo,
        'website': website,
        'institution': institution,
        'area': area,
        'duration_from_date': durationFromDate?.toIso8601String(),
        'duration_to_date': durationToDate?.toIso8601String(),
        'current_education': currentEducation,
        'description': description,
        'qualification_type_title': qualificationTypeTitle,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'qualification': qualification?.toJson(),
        'country': country?.toJson(),
        'study_duration': studyDuration,
      };
}
