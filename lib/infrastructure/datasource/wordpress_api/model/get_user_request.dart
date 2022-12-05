import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/context.dart';

class WPGetUserRequest {
  final int id;
  final WPContext context;

  WPGetUserRequest({
    required this.id,
    this.context = WPContext.view,
  });

  Map<String, dynamic> toMap() {
    final data = {
      'context': context.name,
    };
    return data;
  }
}
