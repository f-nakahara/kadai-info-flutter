import 'author.dart';

/// 記事
class Article {
  final String id;
  final String title;
  final DateTime publishedAt;
  final String thumbnailUrl;
  final Author author;

  Article({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.thumbnailUrl,
    required this.author,
  });
}