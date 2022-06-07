class JoinDataModel {
  int? id;
  int? articleId;
  int? articleCategoryId;

  JoinDataModel({this.id, this.articleId, this.articleCategoryId});

  factory JoinDataModel.fromJson(Map<String, dynamic> json) => JoinDataModel(
        id: json['id'] as int?,
        articleId: json['article_id'] as int?,
        articleCategoryId: json['article_category_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'article_id': articleId,
        'article_category_id': articleCategoryId,
      };
}
