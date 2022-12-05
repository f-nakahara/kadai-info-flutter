import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/domain/repository/article/i_article_repository.dart';
import 'package:kadai_info_flutter/infrastructure/repository/article_repository.dart';

final articleRepositoryProvider = Provider<IArticleRepository>(
  (ref) => ArticleRepository(),
);