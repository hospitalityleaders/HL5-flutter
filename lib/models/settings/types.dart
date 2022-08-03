import 'achievement_types.dart';
import 'countries.dart';
import 'expertise_list.dart';
import 'languages_proficiencies.dart';
import 'languages_types.dart';
import 'membership_grade.dart';
import 'user_title_types.dart';

class Types {
  List<MembershipGrade>? membershipGrades;
  AchievementTypes? achievementTypes;
  Countries? countries;
  LanguagesTypes? languagesTypes;
  LanguagesProficiencies? languagesProficiencies;
  UserTitleTypes? userTitleTypes;
  ExpertiseList? expertiseList;

  Types({
    this.membershipGrades,
    this.achievementTypes,
    this.countries,
    this.languagesTypes,
    this.languagesProficiencies,
    this.userTitleTypes,
    this.expertiseList,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        membershipGrades: (json['membership_grades'] as List<dynamic>?)
            ?.map((e) => MembershipGrade.fromJson(e as Map<String, dynamic>))
            .toList(),
        achievementTypes: json['achievement_types'] == null
            ? null
            : AchievementTypes.fromJson(
                json['achievement_types'] as Map<String, dynamic>),
        countries: json['countries'] == null
            ? null
            : Countries.fromJson(json['countries'] as Map<String, dynamic>),
        languagesTypes: json['languages_types'] == null
            ? null
            : LanguagesTypes.fromJson(
                json['languages_types'] as Map<String, dynamic>),
        languagesProficiencies: json['languages_proficiencies'] == null
            ? null
            : LanguagesProficiencies.fromJson(
                json['languages_proficiencies'] as Map<String, dynamic>),
        userTitleTypes: json['user_title_types'] == null
            ? null
            : UserTitleTypes.fromJson(
                json['user_title_types'] as Map<String, dynamic>),
        expertiseList: json['expertise_list'] == null
            ? null
            : ExpertiseList.fromJson(
                json['expertise_list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'membership_grades': membershipGrades?.map((e) => e.toJson()).toList(),
        'achievement_types': achievementTypes?.toJson(),
        'countries': countries?.toJson(),
        'languages_types': languagesTypes?.toJson(),
        'languages_proficiencies': languagesProficiencies?.toJson(),
        'user_title_types': userTitleTypes?.toJson(),
        'expertise_list': expertiseList?.toJson(),
      };
}
