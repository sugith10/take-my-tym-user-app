import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class AppVibration {
  AppVibration._();

  /// Vibrates the device for the specified [duration].
  static void customVibrate({int? duration}) {
    duration = duration ?? 500;
    Vibration.vibrate(duration: duration);
  }

  static void hapticFeedbackHeavy({int? duration}) {
    HapticFeedback.heavyImpact();
  }

  static void hapticFeedbacklight({int? duration}) {
    HapticFeedback.lightImpact();
  }
}
