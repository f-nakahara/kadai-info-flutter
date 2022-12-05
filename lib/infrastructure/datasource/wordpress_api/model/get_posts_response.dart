import 'package:dio/dio.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/post.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/response_header.dart';

class WPGetPostsResponse {
  final List<WPPost> data;
  final WPResponseHeader header;

  WPGetPostsResponse({
    required this.header,
    required this.data,
  });

  factory WPGetPostsResponse.fromResponse(Response<List> response) {
    return WPGetPostsResponse(
      header: WPResponseHeader.fromMap(response.headers.map),
      data: response.data?.map((e) => WPPost.fromMap(e)).toList() ?? [],
    );
  }
}
