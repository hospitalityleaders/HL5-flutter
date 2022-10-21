// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      slug: json['slug'] as String,
      avatar: json['avatar'] as String,
      embed_src: json['embed_src'] as String,
      full_name: json['full_name'] as String,
      expertise_string: json['expertise_string'] as String,
      active_status: json['active_status'] as String,
      avatar_cdn: json['avatar_cdn'] as String,
      holedo_url: json['holedo_url'] as String,
      total_experience: json['total_experience'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'slug': instance.slug,
      'avatar': instance.avatar,
      'embed_src': instance.embed_src,
      'full_name': instance.full_name,
      'expertise_string': instance.expertise_string,
      'active_status': instance.active_status,
      'avatar_cdn': instance.avatar_cdn,
      'holedo_url': instance.holedo_url,
      'total_experience': instance.total_experience,
      'token': instance.token,
    };
