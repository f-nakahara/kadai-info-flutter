import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/domain/entity/article.dart';
import 'package:kadai_info_flutter/domain/entity/article_list.dart';
import 'package:kadai_info_flutter/domain/usecase/get_article_list.dart';
import 'package:kadai_info_flutter/presentation/state/article_category.dart';

final articleStateProviders =
    StateProvider.family<Article, ArticleStateParam>((ref, param) {
  final article = ref
      .watch(articleListStateProviders(param.category))
      .asData!
      .value
      .values
      .singleWhere((element) => element.id == param.articleId);
  return article;
});

final articleListStateProviders = StateNotifierProvider.family<ArticleListState,
    AsyncValue<ArticleList>, ArticleCategory>(
  (ref, category) {
    return ArticleListState(
      category: category,
      getArticleListUseCase: ref.watch(getArticleListUseCaseProvider),
    );
  },
);

class ArticleListState extends StateNotifier<AsyncValue<ArticleList>> {
  ArticleListState({
    required this.category,
    required this.getArticleListUseCase,
  }) : super(const AsyncLoading()) {
    _fetch();
  }

  final IGetArticleListUseCase getArticleListUseCase;
  final ArticleCategory category;

  Future<void> _fetch() async {
    if (category != ArticleCategory.favorite) {
      state = await AsyncValue.guard(() async {
        final param = GetArticleListUseCaseParam(
            categories: [category.toEntity()], perPage: 20, page: 1);
        final result = await getArticleListUseCase.execute(param);
        return result;
      });
    }
  }
}

class ArticleStateParam {
  final String articleId;
  final ArticleCategory category;

  ArticleStateParam({
    required this.category,
    required this.articleId,
  });
}
