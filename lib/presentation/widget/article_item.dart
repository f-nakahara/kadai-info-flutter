import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/presentation/page/article_page.dart';
import 'package:kadai_info_flutter/presentation/state/article_category.dart';
import 'package:kadai_info_flutter/presentation/util/navigator_util.dart';

import '../state/article_list.dart';
import 'author_item.dart';

/// 記事
class ArticleItem extends ConsumerWidget {
  const ArticleItem({
    Key? key,
    required this.id,
    required this.category,
  }) : super(key: key);

  final String id;
  final ArticleCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(articleStateProviders(
        ArticleStateParam(category: category, articleId: id)));
    return ListTile(
      title: _TitleText(title: state.title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AuthorItem(author: state.author),
          const _FavoriteButton(),
        ],
      ),
      trailing: _ThumbnailImage(thumbnailUrl: state.thumbnailUrl),
      onTap: () {
        NavigatorUtil.push(
          context: context,
          page: ArticlePage(id: id, category: category),
          fullscreenDialog: true,
        );
      },
    );
  }
}

/// サムネイル画像
class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({
    Key? key,
    required this.thumbnailUrl,
  }) : super(key: key);

  final String? thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1.91 / 1,
        child: thumbnailUrl != null
            ? Image.network(
                thumbnailUrl!,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'asset/no_image.png',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

/// 記事タイトル
class _TitleText extends StatelessWidget {
  const _TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    );
  }
}

/// お気に入りボタン
class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Icon(Icons.favorite_border),
    );
  }
}
