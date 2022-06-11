
class MenuItem {
  String? title;
  String? path;
  bool? inNav;
  bool? inDrawer;
  bool? loginOnly;

  MenuItem({
    this.title,
    this.path,
    this.inNav,
    this.inDrawer,
    this.loginOnly,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        title: json['title'] as String,
        path: json['path'] as String,
        inNav: json['inNav'] as bool?,
        inDrawer: json['inDrawer'] as bool?,
        loginOnly: json['loginOnly'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'path': path,
        'inNav': inNav,
        'inDrawer': inDrawer,
        'loginOnly': loginOnly,
      };
}
