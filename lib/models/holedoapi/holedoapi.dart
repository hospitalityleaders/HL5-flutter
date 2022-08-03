import 'package:holedo/models/models.dart';

export 'data.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/models.dart';

class Holedoapi extends Model {
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

  Future<User> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var res = await Get.put(HoledoDatabase().users)
        .login(email: email, password: password, context: context);

    return res;
  }
}
