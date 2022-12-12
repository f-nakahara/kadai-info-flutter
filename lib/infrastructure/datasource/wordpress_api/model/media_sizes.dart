import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/media.dart';

class WPMediaSizes {
  final WPMedia? thumbnail;
  final WPMedia? medium;
  final WPMedia? large;
  final WPMedia? full;

  WPMediaSizes({
    required this.thumbnail,
    required this.large,
    required this.medium,
    required this.full,
  });

  factory WPMediaSizes.fromMap(Map<String, dynamic> map) {
    return WPMediaSizes(
      thumbnail:
          map['thumbnail'] != null ? WPMedia.fromMap(map['thumbnail']) : null,
      medium: map['medium'] != null ? WPMedia.fromMap(map['medium']) : null,
      large: map['large'] != null ? WPMedia.fromMap(map['large']) : null,
      full: map['full'] != null ? WPMedia.fromMap(map['full']) : null,
    );
  }
}
