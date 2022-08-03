class Child {
  int? id;
  int? parentId;
  String? slug;
  String? title;
  List<dynamic>? children;

  Child({this.id, this.parentId, this.slug, this.title, this.children});

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json['id'] as int?,
        parentId: json['parent_id'] as int?,
        slug: json['slug'] as String?,
        title: json['title'] as String?,
        children: json['children'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent_id': parentId,
        'slug': slug,
        'title': title,
        'children': children,
      };
}
