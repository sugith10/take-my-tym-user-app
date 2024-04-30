part of '../success_page.dart';

class _Feedback {
 static Future<void> call()async{
    SoundPlayer().playSound(path: MyAppAudio.success);
    CoustomVibration().vibrate();
  }
}