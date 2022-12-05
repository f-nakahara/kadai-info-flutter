import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_posts_request.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_user_request.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_user_response.dart';

import 'model/get_posts_response.dart';

abstract class IWordPressApiDatasource {
  /// 投稿一覧の取得
  Future<WPGetPostsResponse> getPosts(WPGetPostsRequest request);

  /// ユーザーの取得
  Future<WPGetUserResponse> getUser(WPGetUserRequest request);
}
