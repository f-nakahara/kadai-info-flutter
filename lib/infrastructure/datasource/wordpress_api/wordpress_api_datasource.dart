import 'package:dio/dio.dart';
import 'package:kadai_info_flutter/core/exception/unidentified.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/i_wordpress_api_datasource.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_posts_request.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_posts_response.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_user_request.dart';

import 'model/get_user_response.dart';

class WordPressApiDatasource implements IWordPressApiDatasource {
  final Dio dio;

  WordPressApiDatasource({
    required this.dio,
  });

  @override
  Future<WPGetPostsResponse> getPosts(WPGetPostsRequest request) async {
    final Response<List> result = await dio.get(
      '/posts',
      queryParameters: request.toMap(),
    );
    if (result.statusCode == 200) {
      final response = WPGetPostsResponse.fromResponse(result);
      return response;
    }
    throw UnidentifiedException();
  }

  @override
  Future<WPGetUserResponse> getUser(WPGetUserRequest request) async {
    final Response<Map<String, dynamic>> result = await dio.get(
      '/users/${request.id}',
      queryParameters: request.toMap(),
    );
    final response = WPGetUserResponse.fromResponse(result);
    return response;
  }
}
