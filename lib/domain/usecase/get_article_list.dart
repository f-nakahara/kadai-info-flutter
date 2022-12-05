import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/application/get_article_list.dart';
import 'package:kadai_info_flutter/domain/repository/article/article_repository_provider.dart';
import 'package:kadai_info_flutter/domain/usecase/i_usecase.dart';

import '../entity/article_category.dart';
import '../entity/article_list.dart';

final getArticleListUseCaseProvider = Provider<IGetArticleListUseCase>(
  (ref) => GetArticleListUseCase(
    articleRepository: ref.watch(articleRepositoryProvider),
  ),
);

abstract class IGetArticleListUseCase
    implements IUseCase<Future<ArticleList>, GetArticleListUseCaseParam> {}

class GetArticleListUseCaseParam {
  final List<ArticleCategory> categories;
  final int page;
  final int perPage;

  GetArticleListUseCaseParam({
    required this.categories,
    required this.perPage,
    required this.page,
  });
}
