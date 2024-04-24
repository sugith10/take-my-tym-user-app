part of '../success_page.dart';

class _Feedback {
 static Future<void> call()async{
    SoundPlayer().playSound(path: "audio/succession.mp3");
    CoustomVibration().vibrate();
  }
}