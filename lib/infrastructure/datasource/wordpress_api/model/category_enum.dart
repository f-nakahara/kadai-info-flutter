import 'package:kadai_info_flutter/domain/entity/article_category.dart';

enum WPCategoryEnum {
  /// SNAP
  snap(40),

  /// インタビュー
  interview(42),

  /// やってみた
  challenge(479),

  /// グルメ
  gourmet(4),

  /// おでかけ
  outdoor(6),

  /// エンタメ
  entertainment(46),

  /// 就職
  recruit(184),

  /// サークルINFO
  circleInfo(48),

  /// その他
  other(-1);

  final int id;
  const WPCategoryEnum(this.id);

  factory WPCategoryEnum.fromEntity(ArticleCategory category) {
    switch (category) {
      case ArticleCategory.snap:
        return WPCategoryEnum.snap;
      case ArticleCategory.interview:
        return WPCategoryEnum.interview;
      case ArticleCategory.challenge:
        return WPCategoryEnum.challenge;
      case ArticleCategory.gourmet:
        return WPCategoryEnum.gourmet;
      case ArticleCategory.outdoor:
        return WPCategoryEnum.outdoor;
      case ArticleCategory.entertainment:
        return WPCategoryEnum.entertainment;
      case ArticleCategory.recruit:
        return WPCategoryEnum.recruit;
      case ArticleCategory.circleInfo:
        return WPCategoryEnum.circleInfo;
      default:
        return WPCategoryEnum.other;
    }
  }
}
