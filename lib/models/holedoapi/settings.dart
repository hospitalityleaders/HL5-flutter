import 'general_settings.dart';
import 'header_links.dart';

import 'membership_grade.dart';

class Settings {
  HeaderLinks? headerLinks;
  GeneralSettings? generalSettings;
  List<MembershipGrade>? membershipGrades;
  Map<String, dynamic>? achievementTypes;
  Map<String, dynamic>? countries;
  Map<String, dynamic>? languagesTypes;
  Map<String, dynamic>? languagesProficiencies;
  Map<String, dynamic>? userTitleTypes;
  Map<String, dynamic>? expertiseList;

  Settings({
    this.headerLinks,
    this.generalSettings,
    this.membershipGrades,
    this.achievementTypes,
    this.countries,
    this.languagesTypes,
    this.languagesProficiencies,
    this.userTitleTypes,
    this.expertiseList,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        headerLinks: json['HeaderLinks'] == null
            ? null
            : HeaderLinks.fromJson(json['HeaderLinks'] as Map<String, dynamic>),
        generalSettings: json['GeneralSettings'] == null
            ? null
            : GeneralSettings.fromJson(
                json['GeneralSettings'] as Map<String, dynamic>),
        membershipGrades: (json['membership_grades'] as List<dynamic>?)
            ?.map((e) => MembershipGrade.fromJson(e as Map<String, dynamic>))
            .toList(),
        achievementTypes: json['achievement_types'] == null
            ? null
            : json['achievement_types'] as Map<String, dynamic>,
        countries: json['countries'] == null
            ? null
            : json['countries'] as Map<String, dynamic>,
        languagesTypes: json['languages_types'] == null
            ? null
            : json['languages_types'] as Map<String, dynamic>,
        languagesProficiencies: json['languages_proficiencies'] == null
            ? null
            : json['languages_proficiencies'] as Map<String, dynamic>,
        userTitleTypes: json['user_title_types'] == null
            ? null
            : json['user_title_types'] as Map<String, dynamic>,
        expertiseList: json['expertise_list'] == null
            ? null
            : json['expertise_list'] as Map<String, dynamic>,
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        'HeaderLinks': headerLinks?.toJson(),
        'GeneralSettings': generalSettings?.toJson(),
        'membership_grades': membershipGrades?.map((e) => e.toJson()).toList(),
        'achievement_types': achievementTypes,
        'countries': countries,
        'languages_types': languagesTypes,
        'languages_proficiencies': languagesProficiencies,
        'user_title_types': userTitleTypes,
        'expertise_list': expertiseList,
      };
}
