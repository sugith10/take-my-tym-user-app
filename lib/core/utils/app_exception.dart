final class MyAppException implements Exception {
  final String title;
  final String message;
  const MyAppException({this.title = "Unexpected", this.message = ""});

  @override
  String toString() {
    return title;
  }
}
