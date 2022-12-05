import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/media_sizes.dart';

class WPMediaDetail {
  final WPMediaSizes sizes;

  WPMediaDetail({
    required this.sizes,
  });

  factory WPMediaDetail.fromMap(Map<String, dynamic> map) {
    return WPMediaDetail(
      sizes: WPMediaSizes.fromMap(map['sizes']),
    );
  }
}
