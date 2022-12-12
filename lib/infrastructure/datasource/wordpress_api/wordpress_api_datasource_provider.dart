import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
              'Basic ${base64Encode('${dotenv.env['WORDPRESS_USER_ID']}:${dotenv.env['WORDPRESS_USER_PASS']}'.codeUnits)}',
        },
      ),
    ),
  ),
);
