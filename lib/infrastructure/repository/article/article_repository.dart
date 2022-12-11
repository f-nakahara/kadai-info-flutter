import 'package:kadai_info_flutter/domain/entity/article.dart';
import 'package:kadai_info_flutter/domain/entity/article_author.dart';
import 'package:kadai_info_flutter/domain/entity/article_category.dart';
import 'package:kadai_info_flutter/domain/entity/article_list.dart';
import 'package:kadai_info_flutter/domain/entity/page_info.dart';
import 'package:kadai_info_flutter/domain/repository/article/i_article_repository.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/i_wordpress_api_datasource.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/category_enum.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_posts_request.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_posts_response.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/post.dart';

class ArticleRepository implements IArticleRepository {
  final IWordPressApiDatasource wordPressApiDatasource;

  ArticleRepository({
    required this.wordPressApiDatasource,
  });

  @override
  Future<ArticleList> findAll({
    required int page,
    required int perPage,
    required List<ArticleCategory> categories,
    required List<ArticleCategory> categoriesExclude,
  }) async {
    try {
      final request = WPGetPostsRequest(
        embed: true,
        page: page,
        perPage: perPage,
        categories:
            categories.map((e) => WPCategoryEnum.fromEntity(e)).toList(),
        categoriesExclude:
            categoriesExclude.map((e) => WPCategoryEnum.fromEntity(e)).toList(),
      );
      final result = await wordPressApiDatasource.getPosts(request);
      final data = result.toEntity(
          page: page, perPage: perPage, category: categories.first);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}

extension on WPGetPostsResponse {
  ArticleList toEntity({
    required int page,
    required int perPage,
    required ArticleCategory category,
  }) {
    final articles = this.data.map((e) => e.toEntity()).toList();
    final data = ArticleList(
      values: articles,
      category: category,
      pageInfo: PageInfo(
        perPage: perPage,
        page: page,
        hasPrevious: page > 1,
        hasNext: page < header.totalPages,
      ),
    );
    return data;
  }
}

extension on WPPost {
  Article toEntity() {
    final article = Article(
      id: '$id',
      title: title.rendered,
      publishedAt: date,
      thumbnailUrl:
          embedded!.featuredMedia.first.mediaDetail.sizes.medium?.sourceUrl,
      author: ArticleAuthor(
        id: '${embedded!.author.first.id}',
        name: embedded!.author.first.name,
        imageUrl: embedded!.author.first.avatarUrls.x48,
      ),
      link: link,
    );
    return article;
  }
}
