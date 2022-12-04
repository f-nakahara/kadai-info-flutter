import 'package:flutter/material.dart';

import 'article_item.dart';

/// 記事一覧
class ArticleList extends StatelessWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
      ],
    );
  }
}
