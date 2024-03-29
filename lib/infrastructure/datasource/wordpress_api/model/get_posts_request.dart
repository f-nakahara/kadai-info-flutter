import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/category_enum.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/context.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/order.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/order_by.dart';

import 'status.dart';

class WPGetPostsRequest {
  final WPContext context;
  final int page;
  final int perPage;
  final String? search;
  final List<int>? author;
  final WPOrderBy orderBy;
  final WPOrder order;
  final List<WPCategoryEnum>? categories;
  final List<WPCategoryEnum>? categoriesExclude;
  final WPStatus status;
  final bool embed;

  WPGetPostsRequest({
    this.author,
    this.page = 1,
    this.perPage = 20,
    this.categories,
    this.categoriesExclude,
    this.context = WPContext.view,
    this.order = WPOrder.desc,
    this.orderBy = WPOrderBy.date,
    this.search,
    this.status = WPStatus.publish,
    this.embed = false,
  });

  Map<String, dynamic> toMap() {
    categories?.remove(WPCategoryEnum.other);
    categoriesExclude?.remove(WPCategoryEnum.other);

    final data = {
      'context': context.name,
      'page': page,
      'per_page': perPage,
      'search': search,
      'author': author?.join(','),
      'orderby': orderBy.name,
      'order': order.name,
      'categories': categories?.map((e) => e.id).join(','),
      'categories_exclude': categoriesExclude?.map((e) => e.id).join(','),
      'status': status.name,
      '_embed': embed,
    };
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
