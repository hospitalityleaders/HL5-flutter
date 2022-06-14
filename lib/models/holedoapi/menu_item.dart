class MenuNavItem {
  String? title;
  String? path;
  bool? inNav;
  bool? inDrawer;
  bool? loginOnly;

  MenuNavItem({
    this.title,
    this.path,
    this.inNav,
    this.inDrawer,
    this.loginOnly,
  });

  factory MenuNavItem.fromJson(Map<String, dynamic> json) => MenuNavItem(
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
