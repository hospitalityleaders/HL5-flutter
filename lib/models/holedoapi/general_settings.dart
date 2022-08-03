import 'package:holedo/models/models.dart';

class GeneralSettings extends Model {
  String? facebookFollowers;
  String? youtubeSubscribers;
  String? twitterFollowers;
  String? instagramFollowers;
  String? googleplusFollowers;
  String? pinterestFollowers;
  String? linkedinFollowers;
  String? jobCardBannerFallback;
  String? jobCardBannerFallbackAlternate;
  String? logoFallback;
  String? companyBannerFallback;
  String? companyBannerFallbackAlternate;
  String? codeHeaderEnabled;
  String? codeHeaderHtml;
  String? codeBodyEnabled;
  String? codeBodyHtml;
  String? codePostTopEnabled;
  String? codePostTopHtml;
  String? codePostBottomEnabled;
  String? codePostBottomHtml;

  GeneralSettings({
    this.facebookFollowers,
    this.youtubeSubscribers,
    this.twitterFollowers,
    this.instagramFollowers,
    this.googleplusFollowers,
    this.pinterestFollowers,
    this.linkedinFollowers,
    this.jobCardBannerFallback,
    this.jobCardBannerFallbackAlternate,
    this.logoFallback,
    this.companyBannerFallback,
    this.companyBannerFallbackAlternate,
    this.codeHeaderEnabled,
    this.codeHeaderHtml,
    this.codeBodyEnabled,
    this.codeBodyHtml,
    this.codePostTopEnabled,
    this.codePostTopHtml,
    this.codePostBottomEnabled,
    this.codePostBottomHtml,
  });

  factory GeneralSettings.fromJson(Map<String, dynamic> json) {
    return GeneralSettings(
      facebookFollowers: json['facebook_followers'] as String?,
      youtubeSubscribers: json['youtube_subscribers'] as String?,
      twitterFollowers: json['twitter_followers'] as String?,
      instagramFollowers: json['instagram_followers'] as String?,
      googleplusFollowers: json['googleplus_followers'] as String?,
      pinterestFollowers: json['pinterest_followers'] as String?,
      linkedinFollowers: json['linkedin_followers'] as String?,
      jobCardBannerFallback: json['job_card_banner_fallback'] as String?,
      jobCardBannerFallbackAlternate:
          json['job_card_banner_fallback_alternate'] as String?,
      logoFallback: json['logo_fallback'] as String?,
      companyBannerFallback: json['company_banner_fallback'] as String?,
      companyBannerFallbackAlternate:
          json['company_banner_fallback_alternate'] as String?,
      codeHeaderEnabled: json['code_header_enabled'] as String?,
      codeHeaderHtml: json['code_header_html'] as String?,
      codeBodyEnabled: json['code_body_enabled'] as String?,
      codeBodyHtml: json['code_body_html'] as String?,
      codePostTopEnabled: json['code_post_top_enabled'] as String?,
      codePostTopHtml: json['code_post_top_html'] as String?,
      codePostBottomEnabled: json['code_post_bottom_enabled'] as String?,
      codePostBottomHtml: json['code_post_bottom_html'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'facebook_followers': facebookFollowers,
        'youtube_subscribers': youtubeSubscribers,
        'twitter_followers': twitterFollowers,
        'instagram_followers': instagramFollowers,
        'googleplus_followers': googleplusFollowers,
        'pinterest_followers': pinterestFollowers,
        'linkedin_followers': linkedinFollowers,
        'job_card_banner_fallback': jobCardBannerFallback,
        'job_card_banner_fallback_alternate': jobCardBannerFallbackAlternate,
        'logo_fallback': logoFallback,
        'company_banner_fallback': companyBannerFallback,
        'company_banner_fallback_alternate': companyBannerFallbackAlternate,
        'code_header_enabled': codeHeaderEnabled,
        'code_header_html': codeHeaderHtml,
        'code_body_enabled': codeBodyEnabled,
        'code_body_html': codeBodyHtml,
        'code_post_top_enabled': codePostTopEnabled,
        'code_post_top_html': codePostTopHtml,
        'code_post_bottom_enabled': codePostBottomEnabled,
        'code_post_bottom_html': codePostBottomHtml,
      };
}
