class WPAvatarUrls {
  final String x24;
  final String x48;
  final String x96;

  WPAvatarUrls({
    required this.x24,
    required this.x48,
    required this.x96,
  });

  factory WPAvatarUrls.fromMap(Map<String, dynamic> map) {
    return WPAvatarUrls(
      x24: map['24'],
      x48: map['48'],
      x96: map['96'],
    );
  }
}
