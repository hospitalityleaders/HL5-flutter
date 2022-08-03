import 'package:holedo/models/models.dart';

class CompanyRole extends Model {
  int? id;
  int? companyId;
  String? title;
  int? createClients;
  int? editClients;
  int? createProjects;
  int? editProjects;
  int? createPipelines;
  int? managePipelineCandidates;
  int? createTasks;
  int? viewTasks;
  int? assignTasks;
  int? scheduleCalendar;
  int? viewCalendars;
  int? scheduleMemberCalendars;
  int? configureSettings;
  int? manageBilling;
  DateTime? created;
  DateTime? modified;
  dynamic deleted;

  CompanyRole({
    this.id,
    this.companyId,
    this.title,
    this.createClients,
    this.editClients,
    this.createProjects,
    this.editProjects,
    this.createPipelines,
    this.managePipelineCandidates,
    this.createTasks,
    this.viewTasks,
    this.assignTasks,
    this.scheduleCalendar,
    this.viewCalendars,
    this.scheduleMemberCalendars,
    this.configureSettings,
    this.manageBilling,
    this.created,
    this.modified,
    this.deleted,
  });

  factory CompanyRole.fromJson(Map<String, dynamic> json) => CompanyRole(
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        title: json['title'] as String?,
        createClients: json['create_clients'] as int?,
        editClients: json['edit_clients'] as int?,
        createProjects: json['create_projects'] as int?,
        editProjects: json['edit_projects'] as int?,
        createPipelines: json['create_pipelines'] as int?,
        managePipelineCandidates: json['manage_pipeline_candidates'] as int?,
        createTasks: json['create_tasks'] as int?,
        viewTasks: json['view_tasks'] as int?,
        assignTasks: json['assign_tasks'] as int?,
        scheduleCalendar: json['schedule_calendar'] as int?,
        viewCalendars: json['view_calendars'] as int?,
        scheduleMemberCalendars: json['schedule_member_calendars'] as int?,
        configureSettings: json['configure_settings'] as int?,
        manageBilling: json['manage_billing'] as int?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        deleted: json['deleted'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_id': companyId,
        'title': title,
        'create_clients': createClients,
        'edit_clients': editClients,
        'create_projects': createProjects,
        'edit_projects': editProjects,
        'create_pipelines': createPipelines,
        'manage_pipeline_candidates': managePipelineCandidates,
        'create_tasks': createTasks,
        'view_tasks': viewTasks,
        'assign_tasks': assignTasks,
        'schedule_calendar': scheduleCalendar,
        'view_calendars': viewCalendars,
        'schedule_member_calendars': scheduleMemberCalendars,
        'configure_settings': configureSettings,
        'manage_billing': manageBilling,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'deleted': deleted,
      };
}
