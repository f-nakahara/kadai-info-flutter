import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/domain/entity/article_category.dart';
import 'package:kadai_info_flutter/domain/usecase/get_article_list.dart';

void main() {
  late IGetArticleListUseCase getArticleListUseCase;

  setUp(() {
    final container = ProviderContainer();
    getArticleListUseCase = container.read(getArticleListUseCaseProvider);
  });

  test('記事一覧の取得 [正常系]', () async {
    final param = GetArticleListUseCaseParam(
        categories: [ArticleCategory.circleInfo], perPage: 20, page: 1);
    final result = await getArticleListUseCase.execute(param);
    print(result.values.map((e) => e.title));
  });
}
