import 'language.dart';
import 'language_proficiency_type.dart';

class UserLanguagesProficiency {
  int? id;
  int? userId;
  int? languageId;
  int? languageProficiencyTypeId;
  LanguageProficiencyType? languageProficiencyType;
  Language? language;

  UserLanguagesProficiency({
    this.id,
    this.userId,
    this.languageId,
    this.languageProficiencyTypeId,
    this.languageProficiencyType,
    this.language,
  });

  factory UserLanguagesProficiency.fromJson(Map<String, dynamic> json) {
    return UserLanguagesProficiency(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      languageId: json['language_id'] as int?,
      languageProficiencyTypeId: json['language_proficiency_type_id'] as int?,
      languageProficiencyType: json['language_proficiency_type'] == null
          ? null
          : LanguageProficiencyType.fromJson(
              json['language_proficiency_type'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'language_id': languageId,
        'language_proficiency_type_id': languageProficiencyTypeId,
        'language_proficiency_type': languageProficiencyType?.toJson(),
        'language': language?.toJson(),
      };
}
