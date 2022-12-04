import 'package:kadai_info_flutter/domain/entity/article_list_type.dart';

import 'article.dart';
import 'page_info.dart';

/// 記事一覧
class ArticleList {
  final List<Article> values;
  final ArticleListType type;
  final PageInfo pageInfo;

  ArticleList({
    required this.values,
    required this.type,
    required this.pageInfo,
  });
}
