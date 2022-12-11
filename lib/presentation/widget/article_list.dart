import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/presentation/state/article_category.dart';
import 'package:kadai_info_flutter/presentation/state/article_list.dart';
import 'package:kadai_info_flutter/presentation/widget/loading_indicator.dart';

import 'article_item.dart';

/// 記事一覧
class ArticleList extends ConsumerWidget {
  const ArticleList({
    Key? key,
    required this.category,
  }) : super(key: key);

  final ArticleCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(articleListStateProviders(category));
    return state.when(
      data: (data) {
        return ListView(
          children: data.values
              .map((e) => ArticleItem(
                    id: e.id,
                    category: category,
                  ))
              .toList(),
        );
      },
      error: (error, _) => Text('$error'),
      loading: () => const LoadingIndicator(),
    );
  }
}
