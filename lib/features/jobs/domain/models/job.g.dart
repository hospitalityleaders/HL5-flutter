// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Job _$$_JobFromJson(Map<String, dynamic> json) => _$_Job(
      id: json['id'] as int?,
      companyId: json['company_id'] as int?,
      countryId: json['country_id'] as int?,
      title: json['title'] as String?,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
      companyName: json['company_name'] as String?,
      url: json['url'] as String?,
      employmentType: json['employment_type'] as String?,
      type: json['type'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
      publishDate: json['publish_date'] as String?,
      expiryDate: json['expiry_date'] as String?,
      cityCountry: json['city_country'] as String?,
      companyCity: json['company_city'] as String?,
      jobImages: (json['job_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      applicants: json['applicants'] as int?,
    );

Map<String, dynamic> _$$_JobToJson(_$_Job instance) => <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'country_id': instance.countryId,
      'title': instance.title,
      'logo': instance.logo,
      'description': instance.description,
      'company_name': instance.companyName,
      'url': instance.url,
      'employment_type': instance.employmentType,
      'type': instance.type,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'created': instance.created,
      'modified': instance.modified,
      'publish_date': instance.publishDate,
      'expiry_date': instance.expiryDate,
      'city_country': instance.cityCountry,
      'company_city': instance.companyCity,
      'job_images': instance.jobImages,
      'applicants': instance.applicants,
    };
