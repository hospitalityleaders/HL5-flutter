class Company {
  int? id;
  dynamic organizationId;
  String? slug;
  String? name;
  dynamic logo;
  bool? tmr;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic addressLine3;
  dynamic city;
  dynamic countryId;
  DateTime? created;
  DateTime? modified;
  dynamic description;
  String? bannerImage;
  dynamic computedLogo;
  dynamic computedBannerImage;
  String? combinedLineAddress;
  String? combinedCityCountry;

  Company({
    this.id,
    this.organizationId,
    this.slug,
    this.name,
    this.logo,
    this.tmr,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.city,
    this.countryId,
    this.created,
    this.modified,
    this.description,
    this.bannerImage,
    this.computedLogo,
    this.computedBannerImage,
    this.combinedLineAddress,
    this.combinedCityCountry,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'] as int?,
        organizationId: json['organization_id'] as dynamic,
        slug: json['slug'] as String?,
        name: json['name'] as String?,
        logo: json['logo'] as dynamic,
        tmr: json['tmr'] as bool?,
        addressLine1: json['address_line_1'] as dynamic,
        addressLine2: json['address_line_2'] as dynamic,
        addressLine3: json['address_line_3'] as dynamic,
        city: json['city'] as dynamic,
        countryId: json['country_id'] as dynamic,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        description: json['description'] as dynamic,
        bannerImage: json['banner_image'] as String?,
        computedLogo: json['computed_logo'] as dynamic,
        computedBannerImage: json['computed_banner_image'] as dynamic,
        combinedLineAddress: json['combined_line_address'] as String?,
        combinedCityCountry: json['combined_city_country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'organization_id': organizationId,
        'slug': slug,
        'name': name,
        'logo': logo,
        'tmr': tmr,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'city': city,
        'country_id': countryId,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'description': description,
        'banner_image': bannerImage,
        'computed_logo': computedLogo,
        'computed_banner_image': computedBannerImage,
        'combined_line_address': combinedLineAddress,
        'combined_city_country': combinedCityCountry,
      };
}
