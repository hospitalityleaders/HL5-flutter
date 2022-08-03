import 'package:holedo/models/models.dart';

import 'dart:convert';
import 'package:holedo/models/holedoapi/company.dart';
import 'package:holedo/models/holedoapi/page.dart';
import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/identity.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/models/holedoapi/block.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/models/holedoapi/settings.dart';

export 'package:holedo/models/holedoapi/company.dart';
export 'package:holedo/models/holedoapi/page.dart';
export 'package:holedo/models/holedoapi/user.dart';

List<DataModel> dataFromJson(Iterable<dynamic> data) => List<DataModel>.from(
      data.map((x) => DataModel.fromJson(x as Map<String, dynamic>)),
    );

String dataToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel extends Model {
  bool? success;
  String? messages;
  Settings? settings;
  Block? block;
  List<ArticleCategory>? articleCategories;
  int? count;
  List<Article>? articles;
  Article? article;
  List<Job>? jobs;
  Job? job;
  List<User>? users;
  User? user;
  String? token;
  List<PageContent>? pages;
  List<Company>? companies;
  List<Identity>? identities;
  Identity? identity;

  DataModel(
      {this.success,
      this.messages,
      this.settings,
      this.block,
      this.articleCategories,
      this.count,
      this.articles,
      this.article,
      this.jobs,
      this.job,
      this.users,
      this.user,
      this.token,
      this.pages,
      this.companies,
      this.identities,
      this.identity});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        success: json['success'] == null ? false : true,
        messages: json['messages'] as String?,
        settings: json['Settings'] == null
            ? null
            : Settings.fromJson(json['Settings'] as Map<String, dynamic>),
        block: json['Block'] == null
            ? null
            : Block.fromJson(json['Block'] as Map<String, dynamic>),
        articleCategories: (json['ArticleCategories'] as List<dynamic>?)
            ?.map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        count: json['count'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
        article: json['article'] == null
            ? null
            : Article.fromJson(json['article'] as Map<String, dynamic>),
        jobs: (json['jobs'] as List<dynamic>?)
            ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
            .toList(),
        job: json['job'] == null
            ? null
            : Job.fromJson(json['job'] as Map<String, dynamic>),
        users: (json['users'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] == null ? null : json['token'] as String?,
        pages: json['Pages'] == null
            ? null
            : (json['Pages'] as List<dynamic>?)
                ?.map((e) => PageContent.fromJson(e as Map<String, dynamic>))
                .toList(),
        companies: json['Companies'] == null
            ? null
            : (json['Companies'] as List<dynamic>?)
                ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
                .toList(),
        identities: (json['identities'] as List<dynamic>?)
            ?.map((e) => Identity.fromJson(e as Map<String, dynamic>))
            .toList(),
        identity: json['identity'] == null
            ? null
            : Identity.fromJson(json['identity'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Success': success,
        'Messages': messages.toString(),
        'Settings': settings?.toJson(),
        'Block': block?.toJson(),
        'ArticleCategories': articleCategories?.map((e) => e.toJson()).toList(),
        'count': count,
        'articles': articles?.map((e) => e.toJson()).toList(),
        'article': article?.toJson(),
        'jobs': jobs?.map((e) => e.toJson()).toList(),
        'job': job?.toJson(),
        'users': users?.map((e) => e.toJson()).toList(),
        'user': user?.toJson(),
        'token': token,
        'Pages': pages?.map((e) => e.toJson()).toList(),
        'Companies': companies?.map((e) => e.toJson()).toList(),
        'identities': identities?.map((e) => e.toJson()).toList(),
        'identity': identity?.toJson(),
      };
}
