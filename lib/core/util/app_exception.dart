/// Represents an exception used throughout the application.
class AppException implements Exception {
  /// The title of the exception.
  ///
  /// Defaults to 'Oops!'.
  final String alert;

  /// Details or description of the exception.
  ///
  /// Defaults to 'Something went wrong. Please try again later.'.
  final String details;

  /// Constructs an [AppException] with optional [alert] and [details].
  const AppException({this.alert = 'Oops!', this.details = 'Something went wrong. Please try again later.'});

  /// Overrides the default toString method to provide a formatted exception message.
  @override
  String toString() {
    return '$alert $details';
  }
}
