import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

abstract class _Vibration {
  void vibrate({int? duration});
}

class CoustomVibration implements _Vibration {
  @override
  void vibrate({int? duration}) {
    duration = duration ?? 500;
    Vibration.vibrate(duration: duration);
  }
}

class HapticFeedbackVibration implements _Vibration {
  @override
  void vibrate({int? duration}) {
    HapticFeedback.heavyImpact();
  }
}