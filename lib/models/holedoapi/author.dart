List<Author> getAuthors(Iterable<dynamic> data) => List<Author>.from(
    data.map((x) => Author.fromJson(x as Map<String, dynamic>)));

class Author {
  int? id;
  String? firstName;
  String? lastName;
  String? slug;
  String? embedSrc;
  String? fullName;
  String? expertiseString;
  String? activeStatus;
  dynamic avatarCdn;
  String? holedoUrl;

  Author({
    this.id,
    this.firstName,
    this.lastName,
    this.slug,
    this.embedSrc,
    this.fullName,
    this.expertiseString,
    this.activeStatus,
    this.avatarCdn,
    this.holedoUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json['id'] as int?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        slug: json['slug'] as String?,
        embedSrc: json['embed_src'] as String?,
        fullName: json['full_name'] as String?,
        expertiseString: json['expertise_string'] as String?,
        activeStatus: json['active_status'] as String?,
        avatarCdn: json['avatar_cdn'] as dynamic,
        holedoUrl: json['holedo_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'slug': slug,
        'embed_src': embedSrc,
        'full_name': fullName,
        'expertise_string': expertiseString,
        'active_status': activeStatus,
        'avatar_cdn': avatarCdn,
        'holedo_url': holedoUrl,
      };
}
