import 'package:holedo/models/models.dart';

class HeaderLinks extends Model {
  String? holedoHub;
  String? holedoChat;
  String? holedoJobs;

  HeaderLinks({this.holedoHub, this.holedoChat, this.holedoJobs});

  factory HeaderLinks.fromJson(Map<String, dynamic> json) => HeaderLinks(
        holedoHub: json['Holedo Hub'] as String?,
        holedoChat: json['Holedo Chat'] as String?,
        holedoJobs: json['Holedo Jobs'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Holedo Hub': holedoHub,
        'Holedo Chat': holedoChat,
        'Holedo Jobs': holedoJobs,
      };
}
