class Page {
  int? id;
  int? pageStatusTypeId;
  String? title;
  String? slug;
  String? content;
  String? bannerImage;
  bool? featured;
  String? created;

  Page({
    this.id,
    this.pageStatusTypeId,
    this.title,
    this.slug,
    this.content,
    this.bannerImage,
    this.featured,
    this.created,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        id: json['id'] as int?,
        pageStatusTypeId: json['page_status_type_id'] as int?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        content: json['content'] as String?,
        bannerImage: json['banner_image'] as String?,
        featured: json['featured'] as bool?,
        created: json['created'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'page_status_type_id': pageStatusTypeId,
        'title': title,
        'slug': slug,
        'content': content,
        'banner_image': bannerImage,
        'featured': featured,
        'created': created,
      };
}
