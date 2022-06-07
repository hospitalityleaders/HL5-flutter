import 'general_settings.dart';
import 'header_links.dart';

class Settings {
  HeaderLinks? headerLinks;
  GeneralSettings? generalSettings;

  Settings({this.headerLinks, this.generalSettings});

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        headerLinks: json['HeaderLinks'] == null
            ? null
            : HeaderLinks.fromJson(json['HeaderLinks'] as Map<String, dynamic>),
        generalSettings: json['GeneralSettings'] == null
            ? null
            : GeneralSettings.fromJson(
                json['GeneralSettings'] as Map<String, dynamic>),
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        'HeaderLinks': headerLinks?.toJson(),
        'GeneralSettings': generalSettings?.toJson(),
      };
}
