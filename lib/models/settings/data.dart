import 'settings.dart';

class Data {
  Settings? settings;

  Data({this.settings});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        settings: json['Settings'] == null
            ? null
            : Settings.fromJson(json['Settings'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Settings': settings?.toJson(),
      };
}
