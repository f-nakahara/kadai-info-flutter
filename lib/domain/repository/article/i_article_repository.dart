import '../../entity/article_list.dart';

abstract class IArticleRepository {
  Future<ArticleList> findAll();
}
