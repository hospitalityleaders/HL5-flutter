import 'data.dart';

class Holedo {
  bool? success;
  dynamic errors;
  dynamic messages;
  Data? data;

  Holedo({this.success, this.errors, this.messages, this.data});

  factory Holedo.fromJson(Map<String, dynamic> json) => Holedo(
        success: json['success'] as bool?,
        errors: json['errors'] as dynamic,
        messages: json['messages'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'errors': errors,
        'messages': messages,
        'data': data?.toJson(),
      };
}
