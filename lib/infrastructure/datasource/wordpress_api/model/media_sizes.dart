import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/media.dart';

class WPMediaSizes {
  final WPMedia thumbnail;

  WPMediaSizes({
    required this.thumbnail,
  });

  factory WPMediaSizes.fromMap(Map<String, dynamic> map) {
    return WPMediaSizes(
      thumbnail: WPMedia.fromMap(map['thumbnail']),
    );
  }
}
