import 'package:flutter/material.dart';

import 'author_item.dart';

/// 記事
class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const _TitleText(),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AuthorItem(),
          _FavoriteButton(),
        ],
      ),
      trailing: const _ThumbnailImage(),
      onTap: () {},
    );
  }
}

/// サムネイル画像
class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1.91 / 1,
        child: Image.network(
          'https://kadai-info.com/wordpress/wp-content/uploads/2021/12/curry-eyecatch-300x208.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// 記事タイトル
class _TitleText extends StatelessWidget {
  const _TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '【1時間で本格スパイスカレー⁈】3種のスパイスで一からカレー作ってみた！',
      style: TextStyle(
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
