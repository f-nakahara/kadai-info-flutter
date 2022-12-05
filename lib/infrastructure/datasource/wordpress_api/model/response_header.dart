class WPResponseHeader {
  final int total;
  final int totalPages;

  WPResponseHeader({
    required this.total,
    required this.totalPages,
  });

  factory WPResponseHeader.fromMap(Map<String, dynamic> map) {
    return WPResponseHeader(
      total: int.parse(map['X-WP-Total'][0]),
      totalPages: int.parse(map['X-WP-TotalPages'][0]),
    );
  }
}
