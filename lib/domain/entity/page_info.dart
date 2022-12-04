/// リスト情報
class PageInfo {
  final int page;
  final int perPage;
  final bool hasNext;
  final bool hasPrevious;

  PageInfo({
    required this.perPage,
    required this.page,
    required this.hasPrevious,
    required this.hasNext,
  });
}
