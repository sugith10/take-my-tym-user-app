import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

/// Abstract class defining a sound player.
abstract class _SoundPlayer {
  // Play a sound from the given path
  Future<void> playSound({required String path});
}

/// Utility class for play sound in the background
class AppSoundPlayer implements _SoundPlayer {
  // Reference to the audio player
  final player = AudioPlayer();
  // Override the playSound method
  @override
  Future<void> playSound({required String path}) async {
    try {
      // Play the sound from the given path
      await player.play(AssetSource(path));
    } catch (e) {
      log(e.toString());
    }
  }
}
