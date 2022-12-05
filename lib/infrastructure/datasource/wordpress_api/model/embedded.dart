import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/featrued_media.dart';

class WPEmbedded {
  final List<WPFeaturedMedia> featuredMedia;

  WPEmbedded({
    required this.featuredMedia,
  });

  factory WPEmbedded.fromMap(Map<String, dynamic> map) {
    return WPEmbedded(
      featuredMedia: (map['wp:featuredmedia'] as List)
          .map((e) => WPFeaturedMedia.fromMap(e))
          .toList(),
    );
  }
}
