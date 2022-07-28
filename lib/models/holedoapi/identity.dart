import 'user.dart';

class Identity {
  int? userId;
  String? sessionToken;
  String? address;
  String? data;
  String? expiry;
  String? created;
  User? user;
  bool? usersMatch;
  bool? active;

  Identity({
    this.userId,
    this.sessionToken,
    this.address,
    this.data,
    this.expiry,
    this.created,
    this.user,
    this.usersMatch,
    this.active,
  });

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        userId: json['user_id'] as int?,
        sessionToken: json['session_token'] as String?,
        address: json['address'] as String?,
        data: json['data'] as String?,
        expiry: json['expiry'] as String?,
        created: json['created'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        usersMatch: json['users_match'] as bool?,
        active: json['active'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'session_token': sessionToken,
        'address': address,
        'data': data,
        'expiry': expiry,
        'created': created,
        'user': user?.toJson(),
        'users_match': usersMatch,
        'active': active,
      };
}
