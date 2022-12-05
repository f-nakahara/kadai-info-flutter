import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/media_detail.dart';

class WPFeaturedMedia {
  final WPMediaDetail mediaDetail;

  WPFeaturedMedia({
    required this.mediaDetail,
  });

  factory WPFeaturedMedia.fromMap(Map<String, dynamic> map) {
    return WPFeaturedMedia(
      mediaDetail: WPMediaDetail.fromMap(map['media_details']),
    );
  }
}
