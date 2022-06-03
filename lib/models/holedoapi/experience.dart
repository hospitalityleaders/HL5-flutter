import 'country.dart';
import 'position_level.dart';

class Experience {
  int? id;
  int? userId;
  int? countryId;
  int? currencyId;
  dynamic companyId;
  dynamic leaveDayTypesId;
  dynamic departmentId;
  int? positionLevelId;
  String? title;
  String? companyName;
  String? companyWebsite;
  String? area;
  DateTime? fromDate;
  DateTime? toDate;
  bool? currentWork;
  dynamic salary;
  String? description;
  DateTime? created;
  DateTime? modified;
  dynamic department;
  Country? country;
  dynamic company;
  PositionLevel? positionLevel;
  String? workDuration;

  Experience({
    this.id,
    this.userId,
    this.countryId,
    this.currencyId,
    this.companyId,
    this.leaveDayTypesId,
    this.departmentId,
    this.positionLevelId,
    this.title,
    this.companyName,
    this.companyWebsite,
    this.area,
    this.fromDate,
    this.toDate,
    this.currentWork,
    this.salary,
    this.description,
    this.created,
    this.modified,
    this.department,
    this.country,
    this.company,
    this.positionLevel,
    this.workDuration,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        countryId: json['country_id'] as int?,
        currencyId: json['currency_id'] as int?,
        companyId: json['company_id'] as dynamic,
        leaveDayTypesId: json['leave_day_types_id'] as dynamic,
        departmentId: json['department_id'] as dynamic,
        positionLevelId: json['position_level_id'] as int?,
        title: json['title'] as String?,
        companyName: json['company_name'] as String?,
        companyWebsite: json['company_website'] as String?,
        area: json['area'] as String?,
        fromDate: json['from_date'] == null
            ? null
            : DateTime.parse(json['from_date'] as String),
        toDate: json['to_date'] == null
            ? null
            : DateTime.parse(json['to_date'] as String),
        currentWork: json['current_work'] as bool?,
        salary: json['salary'] as dynamic,
        description: json['description'] as String?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        department: json['department'] as dynamic,
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        company: json['company'] as dynamic,
        positionLevel: json['position_level'] == null
            ? null
            : PositionLevel.fromJson(
                json['position_level'] as Map<String, dynamic>),
        workDuration: json['work_duration'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'country_id': countryId,
        'currency_id': currencyId,
        'company_id': companyId,
        'leave_day_types_id': leaveDayTypesId,
        'department_id': departmentId,
        'position_level_id': positionLevelId,
        'title': title,
        'company_name': companyName,
        'company_website': companyWebsite,
        'area': area,
        'from_date': fromDate?.toIso8601String(),
        'to_date': toDate?.toIso8601String(),
        'current_work': currentWork,
        'salary': salary,
        'description': description,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'department': department,
        'country': country?.toJson(),
        'company': company,
        'position_level': positionLevel?.toJson(),
        'work_duration': workDuration,
      };
}
