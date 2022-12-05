class WPMedia {
  final String sourceUrl;
  final int width;
  final int height;

  WPMedia({
    required this.sourceUrl,
    required this.width,
    required this.height,
  });

  factory WPMedia.fromMap(Map<String, dynamic> map) {
    return WPMedia(
      sourceUrl: map['source_url'],
      height: map['height'],
      width: map['width'],
    );
  }
}
