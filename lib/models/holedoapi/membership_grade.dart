class MembershipGrade {
  int? id;
  String? name;
  String? title;
  String? description;
  int? points;
  String? icon;

  MembershipGrade({
    this.id,
    this.name,
    this.title,
    this.description,
    this.points,
    this.icon,
  });

  factory MembershipGrade.fromJson(Map<String, dynamic> json) {
    return MembershipGrade(
      id: json['id'] as int?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      points: json['points'] as int?,
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'description': description,
        'points': points,
        'icon': icon,
      };
}
