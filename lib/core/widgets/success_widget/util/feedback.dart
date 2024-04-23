part of '../success_page.dart';

class _Feedback {
  final player = AudioPlayer();

  Future<void> playSound() async {
    try {
      // HapticFeedback.heavyImpact();
      await player.play(AssetSource("audio/succession.mp3"));
      Vibration.vibrate(duration: 500);
    } catch (e) {
      log(e.toString());
    }
  }
}
