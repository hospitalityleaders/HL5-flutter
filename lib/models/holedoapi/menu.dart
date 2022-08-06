import 'package:holedo/models/models.dart';

class Menu extends Model {
  dynamic parentId;
  String? slug;
  String? title;
  List<Menu>? children;
  bool? loginOnly;

  Menu({this.parentId, this.slug, this.title, this.children, this.loginOnly});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        parentId: json['parent_id'] as dynamic,
        slug: json['slug'] as String?,
        title: json['title'] as String?,
        children: (json['children'] as List<dynamic>?)
            ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
            .toList(),
        loginOnly: json['login_only'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'parent_id': parentId,
        'slug': slug.toString(),
        'title': title,
        'children': children?.map((e) => e.toJson()).toList(),
        'login_only': loginOnly,
      };
}
