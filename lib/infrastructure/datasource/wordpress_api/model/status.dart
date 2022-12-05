enum WPStatus {
  publish,
  future,
  draft,
  pending,
  private,
  unknown;

  factory WPStatus.from(String value) {
    switch (value) {
      case 'publish':
        return WPStatus.publish;
      case 'future':
        return WPStatus.future;
      case 'draft':
        return WPStatus.draft;
      case 'pending':
        return WPStatus.pending;
      case 'private':
        return WPStatus.private;
      default:
        return WPStatus.unknown;
    }
  }
}
