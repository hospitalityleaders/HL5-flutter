class ArticleCategory {
  int? id;
  dynamic parentId;
  String? slug;
  String? title;
  bool? menuItem;
  String? blockType;

  ArticleCategory({
    this.id,
    this.parentId,
    this.slug,
    this.title,
    this.menuItem,
    this.blockType,
  });

  factory ArticleCategory.fromJson(Map<String, dynamic> json) {
    return ArticleCategory(
      id: json['id'] as int?,
      parentId: json['parent_id'] as dynamic,
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      menuItem: json['menu_item'] as bool?,
      blockType: json['block_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent_id': parentId,
        'slug': slug,
        'title': title,
        'menu_item': menuItem,
        'block_type': blockType,
      };
}
