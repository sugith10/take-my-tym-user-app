final class AppException implements Exception {
  final String alert;
  final String details;
  const AppException({this.alert = "Oops!", this.details = "Something went wrong. Please try again later."});


  @override
  String toString() {
    return "$alert $details";
  }
}
