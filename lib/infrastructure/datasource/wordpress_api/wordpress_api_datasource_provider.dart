import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/i_wordpress_api_datasource.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/wordpress_api_datasource.dart';

final wordpressApiDatasourceProvider = Provider<IWordPressApiDatasource>(
  (ref) => WordPressApiDatasource(
    dio: Dio(
      BaseOptions(
        baseUrl: 'https://kadai-info.com/wp-json/wp/v2',
        headers: {
          'Authorization':
              'Basic ${base64Encode('kadaiinfo:n4VM mTic XdBm osHt Vddv rV81'.codeUnits)}', // FIXME: 環境変数等にいれる
        },
      ),
    ),
  ),
);
