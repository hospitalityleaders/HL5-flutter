class LinkedCountry {
  int? id;
  String? title;
  String? officialTitle;
  String? titleDeu;
  String? officialTitleDeu;
  String? titleFra;
  String? officialTitleFra;
  String? titleIta;
  String? officialTitleIta;
  String? titleNld;
  String? officialTitleNld;
  String? titleSpa;
  String? officialTitleSpa;
  String? titlePor;
  String? officialTitlePor;
  String? currency;
  String? callingCode;
  String? capital;
  String? tld;
  String? region;
  String? subRegion;
  double? latitude;
  double? longitude;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;

  LinkedCountry({
    this.id,
    this.title,
    this.officialTitle,
    this.titleDeu,
    this.officialTitleDeu,
    this.titleFra,
    this.officialTitleFra,
    this.titleIta,
    this.officialTitleIta,
    this.titleNld,
    this.officialTitleNld,
    this.titleSpa,
    this.officialTitleSpa,
    this.titlePor,
    this.officialTitlePor,
    this.currency,
    this.callingCode,
    this.capital,
    this.tld,
    this.region,
    this.subRegion,
    this.latitude,
    this.longitude,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
  });

  factory LinkedCountry.fromJson(Map<String, dynamic> json) => LinkedCountry(
        id: json['id'] as int?,
        title: json['title'] as String?,
        officialTitle: json['official_title'] as String?,
        titleDeu: json['title_deu'] as String?,
        officialTitleDeu: json['official_title_deu'] as String?,
        titleFra: json['title_fra'] as String?,
        officialTitleFra: json['official_title_fra'] as String?,
        titleIta: json['title_ita'] as String?,
        officialTitleIta: json['official_title_ita'] as String?,
        titleNld: json['title_nld'] as String?,
        officialTitleNld: json['official_title_nld'] as String?,
        titleSpa: json['title_spa'] as String?,
        officialTitleSpa: json['official_title_spa'] as String?,
        titlePor: json['title_por'] as String?,
        officialTitlePor: json['official_title_por'] as String?,
        currency: json['currency'] as String?,
        callingCode: json['calling_code'] as String?,
        capital: json['capital'] as String?,
        tld: json['tld'] as String?,
        region: json['region'] as String?,
        subRegion: json['sub_region'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        cca2: json['cca2'] as String?,
        ccn3: json['ccn3'] as String?,
        cca3: json['cca3'] as String?,
        cioc: json['cioc'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'official_title': officialTitle,
        'title_deu': titleDeu,
        'official_title_deu': officialTitleDeu,
        'title_fra': titleFra,
        'official_title_fra': officialTitleFra,
        'title_ita': titleIta,
        'official_title_ita': officialTitleIta,
        'title_nld': titleNld,
        'official_title_nld': officialTitleNld,
        'title_spa': titleSpa,
        'official_title_spa': officialTitleSpa,
        'title_por': titlePor,
        'official_title_por': officialTitlePor,
        'currency': currency,
        'calling_code': callingCode,
        'capital': capital,
        'tld': tld,
        'region': region,
        'sub_region': subRegion,
        'latitude': latitude,
        'longitude': longitude,
        'cca2': cca2,
        'ccn3': ccn3,
        'cca3': cca3,
        'cioc': cioc,
      };
}
