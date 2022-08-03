import 'package:holedo/models/models.dart';

import 'dart:convert';

import 'article_category.dart';
import 'author.dart';

List<Article> getArticles(Iterable<dynamic> data) => List<Article>.from(
    data.map((x) => Article.fromJson(x as Map<String, dynamic>)));

String apiModelToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article extends Model {
  int? id;
  String? title;
  String? slug;
  String? content;
  String? bannerImage;
  bool? featured;
  DateTime? created;
  List<ArticleCategory>? articleCategories;
  Author? user;

  Article({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.bannerImage,
    this.featured,
    this.created,
    this.articleCategories,
    this.user,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json['id'] as int,
        title: json['title'] as String,
        slug: json['slug'] as String,
        content: json['content'] as String,
        bannerImage: json['banner_image'] as String,
        featured: json['featured'] as bool,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        articleCategories: (json['article_categories'] as List<dynamic>?)
            ?.map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        user: json['user'] == null
            ? null
            : Author.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'content': content,
        'banner_image': bannerImage,
        'featured': featured,
        'created': created?.toIso8601String(),
        'article_categories':
            articleCategories?.map((e) => e.toJson()).toList(),
        'user': user?.toJson(),
      };
}
