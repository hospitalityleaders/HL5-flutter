import 'package:holedo/models/models.dart';

import 'client.dart';
import 'colour.dart';
import 'employment_duration.dart';
import 'job_application.dart';
import 'job_image.dart';
import 'language.dart';
import 'linked_country.dart';
import 'linked_employment_type.dart';
import 'membership_grade.dart';
import 'position_level.dart';
import 'qualification.dart';

List<Job> getJobs(Iterable<dynamic> data) =>
    List<Job>.from(data.map((x) => Job.fromJson(x as Map<String, dynamic>)));

class Job extends Model {
  int? id;
  int? companyId;
  int? clientId;
  int? countryId;
  int? colourId;
  int? membershipGradeId;
  int? employmentDurationId;
  int? employmentTypeId;
  String? slug;
  String? title;
  String? logo;
  String? description;
  String? acronym;
  dynamic companyName;
  dynamic companyDescription;
  dynamic companyLogo;
  dynamic coverImage;
  dynamic url;
  dynamic employmentType;
  String? type;
  dynamic country;
  String? state;
  String? city;
  dynamic indexed;
  int? views;
  dynamic auth;
  int? crawled;
  DateTime? publishDate;
  DateTime? expiryDate;
  int? hidden;
  DateTime? created;
  DateTime? modified;
  dynamic deleted;
  MembershipGrade? membershipGrade;
  LinkedCountry? linkedCountry;
  Client? client;
  EmploymentDuration? employmentDuration;
  LinkedEmploymentType? linkedEmploymentType;
  Colour? colour;
  List<Language>? languages;
  List<Qualification>? qualifications;
  List<PositionLevel>? positionLevels;
  List<JobImage>? jobImages;
  List<JobApplication>? jobApplications;
  Company? company;
  String? cityCountry;
  String? companyCity;
  dynamic computedCompanyLogo;
  dynamic computedCoverImage;
  dynamic computedBannerImage;
  String? holedoUrl;

  Job({
    this.id,
    this.companyId,
    this.clientId,
    this.countryId,
    this.colourId,
    this.membershipGradeId,
    this.employmentDurationId,
    this.employmentTypeId,
    this.slug,
    this.title,
    this.logo,
    this.description,
    this.acronym,
    this.companyName,
    this.companyDescription,
    this.companyLogo,
    this.coverImage,
    this.url,
    this.employmentType,
    this.type,
    this.country,
    this.state,
    this.city,
    this.indexed,
    this.views,
    this.auth,
    this.crawled,
    this.publishDate,
    this.expiryDate,
    this.hidden,
    this.created,
    this.modified,
    this.deleted,
    this.membershipGrade,
    this.linkedCountry,
    this.client,
    this.employmentDuration,
    this.linkedEmploymentType,
    this.colour,
    this.languages,
    this.qualifications,
    this.positionLevels,
    this.jobImages,
    this.jobApplications,
    this.company,
    this.cityCountry,
    this.companyCity,
    this.computedCompanyLogo,
    this.computedCoverImage,
    this.computedBannerImage,
    this.holedoUrl,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        clientId: json['client_id'] as int?,
        countryId: json['country_id'] as int?,
        colourId: json['colour_id'] as int?,
        membershipGradeId: json['membership_grade_id'] as int?,
        employmentDurationId: json['employment_duration_id'] as int?,
        employmentTypeId: json['employment_type_id'] as int?,
        slug: json['slug'] as String?,
        title: json['title'] as String?,
        logo: json['logo'] as String?,
        description: json['description'] as String?,
        acronym: json['acronym'] as String?,
        companyName: json['company_name'] as dynamic,
        companyDescription: json['company_description'] as dynamic,
        companyLogo: json['company_logo'] as dynamic,
        coverImage: json['cover_image'] as dynamic,
        url: json['url'] as dynamic,
        employmentType: json['employment_type'] as dynamic,
        type: json['type'] as String?,
        country: json['country'] as dynamic,
        state: json['state'] as String?,
        city: json['city'] as String?,
        indexed: json['indexed'] as dynamic,
        views: json['views'] as int?,
        auth: json['auth'] as dynamic,
        crawled: json['crawled'] as int?,
        publishDate: json['publish_date'] == null
            ? null
            : DateTime.parse(json['publish_date'] as String),
        expiryDate: json['expiry_date'] == null
            ? null
            : DateTime.parse(json['expiry_date'] as String),
        hidden: json['hidden'] as int?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        deleted: json['deleted'] as dynamic,
        membershipGrade: json['membership_grade'] == null
            ? null
            : MembershipGrade.fromJson(
                json['membership_grade'] as Map<String, dynamic>),
        linkedCountry: json['linked_country'] == null
            ? null
            : LinkedCountry.fromJson(
                json['linked_country'] as Map<String, dynamic>),
        client: json['client'] == null
            ? null
            : Client.fromJson(json['client'] as Map<String, dynamic>),
        employmentDuration: json['employment_duration'] == null
            ? null
            : EmploymentDuration.fromJson(
                json['employment_duration'] as Map<String, dynamic>),
        linkedEmploymentType: json['linked_employment_type'] == null
            ? null
            : LinkedEmploymentType.fromJson(
                json['linked_employment_type'] as Map<String, dynamic>),
        colour: json['colour'] == null
            ? null
            : Colour.fromJson(json['colour'] as Map<String, dynamic>),
        languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
            .toList(),
        qualifications: (json['qualifications'] as List<dynamic>?)
            ?.map((e) => Qualification.fromJson(e as Map<String, dynamic>))
            .toList(),
        positionLevels: (json['position_levels'] as List<dynamic>?)
            ?.map((e) => PositionLevel.fromJson(e as Map<String, dynamic>))
            .toList(),
        jobImages: (json['job_images'] as List<dynamic>?)
            ?.map((e) => JobImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        jobApplications: (json['job_applications'] as List<dynamic>?)
            ?.map((e) => JobApplication.fromJson(e as Map<String, dynamic>))
            .toList(),
        company: json['company'] == null
            ? null
            : Company.fromJson(json['company'] as Map<String, dynamic>),
        cityCountry: json['city_country'] as String?,
        companyCity: json['company_city'] as String?,
        computedCompanyLogo: json['computed_company_logo'] as dynamic,
        computedCoverImage: json['computed_cover_image'] as dynamic,
        computedBannerImage: json['computed_banner_image'] as dynamic,
        holedoUrl: json['holedo_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_id': companyId,
        'client_id': clientId,
        'country_id': countryId,
        'colour_id': colourId,
        'membership_grade_id': membershipGradeId,
        'employment_duration_id': employmentDurationId,
        'employment_type_id': employmentTypeId,
        'slug': slug,
        'title': title,
        'logo': logo,
        'description': description,
        'acronym': acronym,
        'company_name': companyName,
        'company_description': companyDescription,
        'company_logo': companyLogo,
        'cover_image': coverImage,
        'url': url,
        'employment_type': employmentType,
        'type': type,
        'country': country,
        'state': state,
        'city': city,
        'indexed': indexed,
        'views': views,
        'auth': auth,
        'crawled': crawled,
        'publish_date': publishDate?.toIso8601String(),
        'expiry_date': expiryDate?.toIso8601String(),
        'hidden': hidden,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'deleted': deleted,
        'membership_grade': membershipGrade?.toJson(),
        'linked_country': linkedCountry?.toJson(),
        'client': client?.toJson(),
        'employment_duration': employmentDuration?.toJson(),
        'linked_employment_type': linkedEmploymentType?.toJson(),
        'colour': colour?.toJson(),
        'languages': languages?.map((e) => e.toJson()).toList(),
        'qualifications': qualifications?.map((e) => e.toJson()).toList(),
        'position_levels': positionLevels?.map((e) => e.toJson()).toList(),
        'job_images': jobImages?.map((e) => e.toJson()).toList(),
        'job_applications': jobApplications?.map((e) => e.toJson()).toList(),
        'company': company?.toJson(),
        'city_country': cityCountry,
        'company_city': companyCity,
        'computed_company_logo': computedCompanyLogo,
        'computed_cover_image': computedCoverImage,
        'computed_banner_image': computedBannerImage,
        'holedo_url': holedoUrl,
      };
}
