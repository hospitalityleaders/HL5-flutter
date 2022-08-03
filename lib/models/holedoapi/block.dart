import 'package:holedo/models/models.dart';

import 'category.dart';
import 'category_type_a.dart';
import 'category_type_b.dart';
import 'headline.dart';
import 'video.dart';
import 'widget_type_a.dart';
import 'widget_type_b.dart';
import 'widget_type_c.dart';
import 'widget_type_d.dart';
import 'widget_type_e.dart';

class Block extends Model {
  Headline? headline;
  CategoryTypeA? categoryTypeA;
  CategoryTypeB? categoryTypeB;
  Video? video;
  Category? category;
  WidgetTypeA? widgetTypeA;
  WidgetTypeB? widgetTypeB;
  WidgetTypeC? widgetTypeC;
  WidgetTypeD? widgetTypeD;
  WidgetTypeE? widgetTypeE;

  Block({
    this.headline,
    this.categoryTypeA,
    this.categoryTypeB,
    this.video,
    this.category,
    this.widgetTypeA,
    this.widgetTypeB,
    this.widgetTypeC,
    this.widgetTypeD,
    this.widgetTypeE,
  });

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        headline: json['headline'] == null
            ? null
            : Headline.fromJson(json['headline'] as Map<String, dynamic>),
        categoryTypeA: json['category_type_a'] == null
            ? null
            : CategoryTypeA.fromJson(
                json['category_type_a'] as Map<String, dynamic>),
        categoryTypeB: json['category_type_b'] == null
            ? null
            : CategoryTypeB.fromJson(
                json['category_type_b'] as Map<String, dynamic>),
        video: json['video'] == null
            ? null
            : Video.fromJson(json['video'] as Map<String, dynamic>),
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        widgetTypeA: json['widget_type_a'] == null
            ? null
            : WidgetTypeA.fromJson(
                json['widget_type_a'] as Map<String, dynamic>),
        widgetTypeB: json['widget_type_b'] == null
            ? null
            : WidgetTypeB.fromJson(
                json['widget_type_b'] as Map<String, dynamic>),
        widgetTypeC: json['widget_type_c'] == null
            ? null
            : WidgetTypeC.fromJson(
                json['widget_type_c'] as Map<String, dynamic>),
        widgetTypeD: json['widget_type_d'] == null
            ? null
            : WidgetTypeD.fromJson(
                json['widget_type_d'] as Map<String, dynamic>),
        widgetTypeE: json['widget_type_e'] == null
            ? null
            : WidgetTypeE.fromJson(
                json['widget_type_e'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'headline': headline?.toJson(),
        'category_type_a': categoryTypeA?.toJson(),
        'category_type_b': categoryTypeB?.toJson(),
        'video': video?.toJson(),
        'category': category?.toJson(),
        'widget_type_a': widgetTypeA?.toJson(),
        'widget_type_b': widgetTypeB?.toJson(),
        'widget_type_c': widgetTypeC?.toJson(),
        'widget_type_d': widgetTypeD?.toJson(),
        'widget_type_e': widgetTypeE?.toJson(),
      };
}
