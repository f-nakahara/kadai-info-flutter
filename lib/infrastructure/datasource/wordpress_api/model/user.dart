import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/avatar_urls.dart';

class WPUser {
  final int id;
  final String name;
  final String link;
  final String description;
  final WPAvatarUrls avatarUrls;

  WPUser({
    required this.id,
    required this.description,
    required this.avatarUrls,
    required this.link,
    required this.name,
  });

  factory WPUser.fromMap(Map<String, dynamic> map) {
    return WPUser(
      id: map['id'],
      description: map['description'],
      avatarUrls: WPAvatarUrls.fromMap(map['avatar_urls']),
      link: map['link'],
      name: map['name'],
    );
  }
}
