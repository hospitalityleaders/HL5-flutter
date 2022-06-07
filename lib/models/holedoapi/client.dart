class Client {
  int? id;
  int? companyId;
  int? clientTypeId;
  int? countryId;
  String? title;
  String? logo;
  String? addressLine1;
  String? addressLine2;
  String? addressLine3;
  String? areaCode;
  String? city;
  String? state;
  String? description;
  DateTime? created;
  DateTime? modified;
  dynamic deleted;

  Client({
    this.id,
    this.companyId,
    this.clientTypeId,
    this.countryId,
    this.title,
    this.logo,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.areaCode,
    this.city,
    this.state,
    this.description,
    this.created,
    this.modified,
    this.deleted,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        clientTypeId: json['client_type_id'] as int?,
        countryId: json['country_id'] as int?,
        title: json['title'] as String?,
        logo: json['logo'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        addressLine3: json['address_line_3'] as String?,
        areaCode: json['area_code'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        description: json['description'] as String?,
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
        'client_type_id': clientTypeId,
        'country_id': countryId,
        'title': title,
        'logo': logo,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'area_code': areaCode,
        'city': city,
        'state': state,
        'description': description,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'deleted': deleted,
      };
}
