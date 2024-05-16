part of '../success_page.dart';

class _Feedback {
 static Future<void> call()async{
    AppSoundPlayer().playSound(path: MyAppAudio.success);
    AppVibration().vibrate();
  }
}