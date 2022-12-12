import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/domain/entity/article_category.dart';
import 'package:kadai_info_flutter/domain/repository/article/article_repository_provider.dart';
import 'package:kadai_info_flutter/domain/repository/article/i_article_repository.dart';

void main() {
  late IArticleRepository articleRepository;

  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    final container = ProviderContainer();
    articleRepository = container.read(articleRepositoryProvider);
  });

  group('Article Repository', () {
    test('記事一覧の取得 [正常系]', () async {
      final result = await articleRepository.findAll(
        page: 1,
        perPage: 20,
        categories: [ArticleCategory.gourmet],
        categoriesExclude: [],
      );
      print(result.values.map((e) => e.title));
    });
  });
}
