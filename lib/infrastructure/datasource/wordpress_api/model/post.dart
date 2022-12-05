import 'package:kadai_info_flutter/infrastructure/datasource/wordpress_api/model/status.dart';

import 'embedded.dart';
import 'title.dart';

class WPPost {
  final int id;
  final DateTime date;
  final WPStatus status;
  final int author;
  final WPTitle title;
  final WPEmbedded? embedded;

  WPPost({
    required this.status,
    required this.date,
    required this.id,
    required this.author,
    required this.title,
    required this.embedded,
  });

  factory WPPost.fromMap(Map<String, dynamic> map) {
    return WPPost(
      status: WPStatus.from(map['status']),
      date: DateTime.parse(map['date']),
      id: map['id'],
      author: map['author'],
      title: WPTitle.fromMap(map['title']),
      embedded: map['_embedded'] != null
          ? WPEmbedded.fromMap(map['_embedded'])
          : null,
    );
  }
}
