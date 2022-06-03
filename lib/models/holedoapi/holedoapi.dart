import 'data.dart';

class Holedoapi {
  bool? success;
  dynamic errors;
  dynamic messages;
  DataModel? data;

  Holedoapi({this.success, this.errors, this.messages, this.data});

  factory Holedoapi.fromJson(Map<String, dynamic> json) => Holedoapi(
        success: json['success'] as bool?,
        errors: json['errors'] as dynamic,
        messages: json['messages'] as dynamic,
        data: json['data'] == null
            ? null
            : DataModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  get articles => null;
  get getDataModel => data;
  Map<String, dynamic> toJson() => {
        'success': success,
        'errors': errors,
        'messages': messages,
        'data': data?.toJson(),
      };
}
