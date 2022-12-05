class WPCategory {
  final int id;
  final String link;
  final String name;
  final String slug;

  WPCategory({
    required this.id,
    required this.name,
    required this.link,
    required this.slug,
  });

  factory WPCategory.fromMap(Map<String, dynamic> map) {
    return WPCategory(
      id: map['id'],
      name: map['name'],
      link: map['link'],
      slug: map['slug'],
    );
  }
}
