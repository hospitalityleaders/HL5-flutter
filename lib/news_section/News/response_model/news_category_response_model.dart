// To parse this JSON data, do
//
//     final newsCategoryResponseModel = newsCategoryResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// NewsCategoryResponseModel newsCategoryResponseModelFromJson(String str) =>
//     NewsCategoryResponseModel.fromJson(json.decode(str));

String newsCategoryResponseModelToJson(NewsCategoryResponseModel data) =>
    json.encode(data.toJson());

class NewsCategoryResponseModel {
  NewsCategoryResponseModel({
    required this.success,
    required this.errors,
    required this.messages,
    required this.data,
  });

  bool success;
  dynamic errors;
  dynamic messages;
  Data? data;

  factory NewsCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      NewsCategoryResponseModel(
        success: json["success"] as bool,
        errors: json["errors"],
        messages: json["messages"],
        data: json['user'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errors": errors,
        "messages": messages,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.count,
    required this.articles,
  });

  int? count;
  List<Article>? articles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"] as int,
        articles: (json['article'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.bannerImage,
    required this.featured,
    required this.created,
    required this.user,
    required this.articleCategories,
    required this.matchingData,
  });

  int id;
  String title;
  String slug;
  String content;
  String bannerImage;
  bool featured;
  DateTime created;
  User user;
  List<ArticleCategory>? articleCategories;
  MatchingData? matchingData;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"] as int,
        title: json["title"] as String,
        slug: json["slug"] as String,
        content: json["content"] as String,
        bannerImage: json["banner_image"] as String,
        featured: json["featured"] as bool,
        created: DateTime.parse(json["created"] as String),
        user: User.fromJson(json["user"] as Map<String, dynamic>),
        articleCategories: (json['article_categories'] as List<dynamic>?)
            ?.map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        matchingData: json['_matchingData'] == null
            ? null
            : MatchingData.fromJson(json['user'] as Map<String, dynamic>),
        // matchingData: (json['_matchingData'] as MatchingData)
        //     ?.map((e) => MatchingData.fromJson(e as Map<String, dynamic>))
        //     .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "content": content,
        "banner_image": bannerImage,
        "featured": featured,
        "created": created.toIso8601String(),
        "user": user.toJson(),
        "article_categories":
            List<dynamic>.from(articleCategories!.map((x) => x.toJson())),
        "_matchingData": matchingData!.toJson(),
      };
}

class ArticleCategory {
  ArticleCategory({
    required this.id,
    required this.parentId,
    required this.lft,
    required this.rght,
    required this.slug,
    required this.title,
    required this.blockType,
    required this.menuItem,
    required this.created,
    required this.modified,
    required this.deleted,
    required this.joinData,
  });

  int id;
  dynamic parentId;
  int lft;
  int rght;
  String slug;
  String title;
  String blockType;
  bool menuItem;
  DateTime created;
  DateTime modified;
  dynamic deleted;
  JoinData? joinData;

  factory ArticleCategory.fromJson(Map<String, dynamic> json) =>
      ArticleCategory(
        id: json["id"] as int,
        parentId: json["parent_id"],
        lft: json["lft"] as int,
        rght: json["rght"] as int,
        slug: json["slug"] as String,
        title: json["title"] as String,
        blockType: json["block_type"] as String,
        menuItem: json["menu_item"] as bool,
        created: DateTime.parse(json["created"] as String),
        modified: DateTime.parse(json["modified"] as String),
        deleted: json["deleted"],
        joinData: json['_joinData'] == null
            ? null
            : JoinData.fromJson(json['_joinData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "lft": lft,
        "rght": rght,
        "slug": slug,
        "title": title,
        "block_type": blockType,
        "menu_item": menuItem,
        "created": created.toIso8601String(),
        "modified": modified.toIso8601String(),
        "deleted": deleted,
        "_joinData": joinData!.toJson(),
      };
}

class JoinData {
  JoinData({
    required this.id,
    required this.articleId,
    required this.articleCategoryId,
  });

  int id;
  int articleId;
  int articleCategoryId;

  factory JoinData.fromJson(Map<String, dynamic> json) => JoinData(
        id: json["id"] as int,
        articleId: json["article_id"] as int,
        articleCategoryId: json["article_category_id"] as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "article_id": articleId,
        "article_category_id": articleCategoryId,
      };
}

class MatchingData {
  MatchingData({
    required this.articleCategories,
  });

  ArticleCategories? articleCategories;

  factory MatchingData.fromJson(Map<String, dynamic> json) => MatchingData(
        // articleCategories:
        //     ArticleCategories.fromJson(json!["ArticleCategories"]),
        articleCategories: json['ArticleCategories'] == null
            ? null
            : ArticleCategories.fromJson(
                json['ArticleCategories'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "ArticleCategories": articleCategories!.toJson(),
      };
}

class ArticleCategories {
  ArticleCategories({
    required this.slug,
    required this.title,
    required this.id,
  });

  String slug;
  String title;
  int id;

  factory ArticleCategories.fromJson(Map<String, dynamic> json) =>
      ArticleCategories(
        slug: json["slug"] as String,
        title: json["title"] as String,
        id: json["id"] as int,
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "id": id,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.slug,
    required this.embedSrc,
    required this.fullName,
    required this.expertiseString,
    required this.activeStatus,
    required this.avatarCdn,
    required this.holedoUrl,
  });

  int id;
  String firstName;
  String lastName;
  String slug;
  String embedSrc;
  String fullName;
  String expertiseString;
  String activeStatus;
  dynamic avatarCdn;
  String holedoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] as int,
        firstName: json["first_name"] as String,
        lastName: json["last_name"] as String,
        slug: json["slug"] as String,
        embedSrc: json["embed_src"] as String,
        fullName: json["full_name"] as String,
        expertiseString: json["expertise_string"] as String,
        activeStatus: json["active_status"] as String,
        avatarCdn: json["avatar_cdn"],
        holedoUrl: json["holedo_url"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "slug": slug,
        "embed_src": embedSrc,
        "full_name": fullName,
        "expertise_string": expertiseString,
        "active_status": activeStatus,
        "avatar_cdn": avatarCdn,
        "holedo_url": holedoUrl,
      };
}
