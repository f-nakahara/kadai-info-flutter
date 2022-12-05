class WPUser {
  final int id;
  final String name;
  final String link;
  final String description;
  final Map<String, dynamic> avatarUrls;

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
      avatarUrls: map['avatar_urls'],
      link: map['link'],
      name: map['name'],
    );
  }
}
