import 'package:holedo/models/models.dart';

import 'article_category.dart';
import 'block.dart';
import 'general_settings.dart';
import 'header_links.dart';
import 'menu.dart';
import 'types.dart';

class Settings extends Model {
  Types? types;
  List<ArticleCategory>? articleCategories;
  List<Menu>? menus;
  HeaderLinks? headerLinks;
  Block? block;
  GeneralSettings? generalSettings;
  Map<String, dynamic>? ads;

  Settings({
    this.types,
    this.articleCategories,
    this.menus,
    this.headerLinks,
    this.block,
    this.generalSettings,
    this.ads,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        types: json['Types'] == null
            ? null
            : Types.fromJson(json['Types'] as Map<String, dynamic>),
        articleCategories: json['ArticleCategories'] == null
            ? null
            : (json['ArticleCategories'] as List<dynamic>?)
                ?.map(
                    (e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
                .toList(),
        menus: (json['Menus'] as List<dynamic>?)
            ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
            .toList(),
        headerLinks: json['HeaderLinks'] == null
            ? null
            : HeaderLinks.fromJson(json['HeaderLinks'] as Map<String, dynamic>),
        block: json['Block'] == null
            ? null
            : Block.fromJson(json['Block'] as Map<String, dynamic>),
        generalSettings: json['GeneralSettings'] == null
            ? null
            : GeneralSettings.fromJson(
                json['GeneralSettings'] as Map<String, dynamic>),
        ads: json['ads'] == null ? null : json['ads'] as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => {
        'Types': types?.toJson(),
        'ArticleCategories': articleCategories?.map((e) => e.toJson()).toList(),
        'Menus': menus?.map((e) => e.toJson()).toList(),
        'HeaderLinks': headerLinks?.toJson(),
        'Block': block?.toJson(),
        'GeneralSettings': generalSettings?.toJson(),
        'ads': ads,
      };
}
