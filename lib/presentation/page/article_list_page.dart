import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/presentation/state/article_category.dart';
import 'package:kadai_info_flutter/presentation/widget/article_list.dart';

/// 記事一覧画面
class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const _ArticleTabBar(),
        ),
        body: const SafeArea(
          child: _ArticleTabBarView(),
        ),
      ),
    );
  }
}

class _ArticleTabBarView extends ConsumerWidget {
  const _ArticleTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const categories = ArticleCategory.values;
    return TabBarView(
      children: categories.map((e) => ArticleList(category: e)).toList(),
    );
  }
}

class _ArticleTabBar extends ConsumerWidget implements PreferredSizeWidget {
  const _ArticleTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const categories = ArticleCategory.values;
    return TabBar(
      isScrollable: true,
      onTap: (index) => ref
          .read(selectedArticleCategoryStateProvider.notifier)
          .state = categories[index],
      tabs: categories.map((e) => Tab(text: e.value)).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
