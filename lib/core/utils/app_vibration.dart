import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

/// Abstract class defining a vibration.
abstract class _Vibration {
  /// Vibrates the device for the specified [duration].
  void vibrate({int? duration});
}

/// Custom vibration implementation.
class AppVibration implements _Vibration {
  /// Vibrates the device for the specified [duration].
  @override
  void vibrate({int? duration}) {
    duration = duration ?? 500;
    Vibration.vibrate(duration: duration);
  }
}

/// Utility class for Haptic feedback.
class HapticFeedbackVibration implements _Vibration {
  /// Triggers a heavy haptic feedback.
  @override
  void vibrate({int? duration}) {
    HapticFeedback.heavyImpact();
  }
}
