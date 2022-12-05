import 'package:kadai_info_flutter/domain/entity/article_category.dart';
import 'package:kadai_info_flutter/domain/entity/article_list.dart';
import 'package:kadai_info_flutter/domain/repository/article/i_article_repository.dart';
import 'package:kadai_info_flutter/domain/usecase/get_article_list.dart';

class GetArticleListUseCase implements IGetArticleListUseCase {
  final IArticleRepository articleRepository;

  GetArticleListUseCase({
    required this.articleRepository,
  });

  @override
  Future<ArticleList> execute(GetArticleListUseCaseParam param) async {
    final result = await articleRepository.findAll(
      page: param.page,
      perPage: param.perPage,
      categories: param.categories,
      categoriesExclude: [ArticleCategory.circleInfo],
    );
    return result;
  }
}
