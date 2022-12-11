import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/presentation/state/article_category.dart';
import 'package:kadai_info_flutter/presentation/state/article_list.dart';
import 'package:kadai_info_flutter/presentation/widget/article_view.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({
    Key? key,
    required this.id,
    required this.category,
  }) : super(key: key);

  final String id;
  final ArticleCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      articleStateProviders(
        ArticleStateParam(category: category, articleId: id),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(state.title),
      ),
      body: SafeArea(
        child: ArticleView(link: state.link),
      ),
    );
  }
}
