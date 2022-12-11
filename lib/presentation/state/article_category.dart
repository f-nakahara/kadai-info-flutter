import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entity/article_category.dart' as entity;

final selectedArticleCategoryStateProvider = StateProvider(
  (ref) => ArticleCategory.latest,
);

/// 記事カテゴリ
enum ArticleCategory {
  /// お気に入り
  favorite('お気に入り'),

  /// 新着
  latest('新着'),

  /// SNAP
  snap('SNAP'),

  /// インタビュー
  interview('インタビュー'),

  /// やってみた
  challenge('チャレンジ'),

  /// グルメ
  gourmet('グルメ'),

  /// おでかけ
  outdoor('おでかけ'),

  /// エンタメ
  entertainment('エンタメ'),

  /// 就職
  recruit('就職');

  final String value;
  const ArticleCategory(this.value);
}

extension ArticleCategoryExt on ArticleCategory {
  entity.ArticleCategory toEntity() {
    switch (this) {
      case ArticleCategory.favorite:
        return entity.ArticleCategory.favorite;
      case ArticleCategory.latest:
        return entity.ArticleCategory.latest;
      case ArticleCategory.snap:
        return entity.ArticleCategory.snap;
      case ArticleCategory.interview:
        return entity.ArticleCategory.interview;
      case ArticleCategory.challenge:
        return entity.ArticleCategory.challenge;
      case ArticleCategory.gourmet:
        return entity.ArticleCategory.gourmet;
      case ArticleCategory.outdoor:
        return entity.ArticleCategory.outdoor;
      case ArticleCategory.entertainment:
        return entity.ArticleCategory.entertainment;
      case ArticleCategory.recruit:
        return entity.ArticleCategory.recruit;
    }
  }
}
