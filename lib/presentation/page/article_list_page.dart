import 'package:flutter/material.dart';
import 'package:kadai_info_flutter/presentation/widget/article_list.dart';

/// 記事一覧画面
class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const _ArticleTabBar(),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              ArticleList(),
              ArticleList(),
              ArticleList(),
              ArticleList(),
              ArticleList(),
              ArticleList(),
              ArticleList(),
              ArticleList(),
              ArticleList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticleTabBar extends StatelessWidget implements PreferredSizeWidget {
  const _ArticleTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      tabs: [
        Tab(text: 'お気に入り'),
        Tab(text: '新着'),
        Tab(text: 'SNAP'),
        Tab(text: 'インタビュー'),
        Tab(text: 'チャレンジ'),
        Tab(text: 'グルメ'),
        Tab(text: 'おでかけ'),
        Tab(text: 'エンタメ'),
        Tab(text: '就職'),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
