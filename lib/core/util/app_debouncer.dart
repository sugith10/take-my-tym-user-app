import 'dart:async';
import 'package:flutter/foundation.dart';

/// Utility class for debouncing function calls, ensuring they're executed only once after a specified delay.
/// Useful for limiting function call frequency or preventing multiple requests in quick succession.
/// Takes a delay in milliseconds and provides a method to run the debounced function.
/// Debounced function executes only after delay since last call; multiple calls within delay reset timer.
/// Provides a dispose method to cancel pending timers and prevent future debounced function calls.
/// Example usage:
/// ```dart
/// final debouncer = Debouncer(milliseconds: 500);
///
/// void onTextChanged(String value) {
///   debouncer.run(() {
///     // Your function call here
///   });
/// }
/// ```
class Debouncer {
  // Initialize the milliseconds parameter
  final int milliseconds;
  // Initialize a timer variable
  Timer? _timer;

  // Create a constructor which takes in the milliseconds parameter
  Debouncer({required this.milliseconds});

  // Create a method called run which takes in a VoidCallback parameter
  void run(VoidCallback action) {
    // Cancel the timer if it exists
    _timer?.cancel();
    // Create a new timer which calls the action after the milliseconds have passed
    _timer = Timer(
      Duration(milliseconds: milliseconds),
      action,
    );
  }

  // Create a method called dispose which cancels the timer if it exists
  void dispose() {
    // Cancel the timer if it exists
    _timer?.cancel();
  }
}
