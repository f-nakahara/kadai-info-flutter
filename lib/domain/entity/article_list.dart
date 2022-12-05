import 'package:kadai_info_flutter/domain/entity/article_category.dart';

import 'article.dart';
import 'page_info.dart';

/// 記事一覧
class ArticleList {
  final List<Article> values;
  final ArticleCategory category;
  final PageInfo pageInfo;

  ArticleList({
    required this.values,
    required this.category,
    required this.pageInfo,
  });
}
