// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Search _$$_SearchFromJson(Map<String, dynamic> json) => _$_Search(
      pageCount: json['pageCount'] as int,
      count: json['count'] as int,
      perPage: json['perPage'] as int,
      current: json['current'] as int,
      page: json['page'] as int,
      end: json['end'] as int,
    );

Map<String, dynamic> _$$_SearchToJson(_$_Search instance) => <String, dynamic>{
      'pageCount': instance.pageCount,
      'count': instance.count,
      'perPage': instance.perPage,
      'current': instance.current,
      'page': instance.page,
      'end': instance.end,
    };
