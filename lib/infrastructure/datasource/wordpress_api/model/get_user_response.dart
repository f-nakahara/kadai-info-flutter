import 'package:dio/dio.dart';
import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/user.dart';

class WPGetUserResponse {
  final WPUser data;

  WPGetUserResponse({
    required this.data,
  });

  factory WPGetUserResponse.fromResponse(
      Response<Map<String, dynamic>> response) {
    return WPGetUserResponse(data: WPUser.fromMap(response.data!));
  }
}
