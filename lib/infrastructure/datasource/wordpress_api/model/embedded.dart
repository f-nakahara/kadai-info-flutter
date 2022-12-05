import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/featrued_media.dart';

import 'user.dart';

class WPEmbedded {
  final List<WPFeaturedMedia> featuredMedia;
  final List<WPUser> author;

  WPEmbedded({
    required this.featuredMedia,
    required this.author,
  });

  factory WPEmbedded.fromMap(Map<String, dynamic> map) {
    return WPEmbedded(
      featuredMedia: (map['wp:featuredmedia'] as List)
          .map((e) => WPFeaturedMedia.fromMap(e))
          .toList(),
      author: (map['author'] as List).map((e) => WPUser.fromMap(e)).toList(),
    );
  }
}
