import 'package:kadai_info_flutter/domain/entity/article_category.dart';

import '../../entity/article_list.dart';

abstract class IArticleRepository {
  Future<ArticleList> findAll({
    required int page,
    required int perPage,
    required List<ArticleCategory> categories,
    required List<ArticleCategory> categoriesExclude,
  });

  Future<ArticleList> findFavoriteAll({
    required int page,
    required int perPage,
  });
}
