import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/i_wordpress_api_datasource.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_posts_request.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/get_user_request.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/wordpress_api_datasource_provider.dart'; //testコードはこれをimport

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late IWordPressApiDatasource wordPressApiDatasource;

  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    final container = ProviderContainer();
    wordPressApiDatasource = container.read(wordpressApiDatasourceProvider);
  });

  group('WordPressApiDatasource', () {
    test('投稿一覧取得 [正常系]', () async {
      final request = WPGetPostsRequest(
        embed: true,
        page: 1,
      );
      final result = await wordPressApiDatasource.getPosts(request);
      expect(result.data.length, 20);
    });

    test('ユーザー取得 [正常系]', () async {
      final request = WPGetUserRequest(id: 46);
      final result = await wordPressApiDatasource.getUser(request);
      expect(result.data.id, 46);
    });
  });
}
