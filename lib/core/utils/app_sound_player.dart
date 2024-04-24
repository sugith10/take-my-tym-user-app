import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

abstract class _SoundPlayer {
  Future<void> playSound({required String path});
}

class SoundPlayer implements _SoundPlayer {
  final player = AudioPlayer();
  @override
  Future<void> playSound({required String path}) async {
    try {
      await player.play(AssetSource(path));
    } catch (e) {
      log(e.toString());
    }
  }
}
