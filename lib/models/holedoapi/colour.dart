import 'package:holedo/models/models.dart';

class Colour extends Model {
  int? id;
  String? hex;

  Colour({this.id, this.hex});

  factory Colour.fromJson(Map<String, dynamic> json) => Colour(
        id: json['id'] as int?,
        hex: json['hex'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'hex': hex,
      };
}
