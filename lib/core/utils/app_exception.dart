final class MyAppException implements Exception {
  final String title;
  final String message;
  const MyAppException({this.title = "Oops!", this.message = "Something went wrong. Please try again later."});


  @override
  String toString() {
    return "$title $message";
  }
}
