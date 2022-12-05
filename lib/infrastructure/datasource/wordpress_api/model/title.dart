class WPTitle {
  final String rendered;

  WPTitle({
    required this.rendered,
  });

  factory WPTitle.fromMap(Map<String, dynamic> map) {
    return WPTitle(
      rendered: map['rendered'],
    );
  }
}
