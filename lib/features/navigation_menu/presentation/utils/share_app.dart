import 'package:share_plus/share_plus.dart';

class ShareApp {
  Future<void> _call() async {
    const urlPreview =
        "https://play.google.com/store/apps/developer?id=Day+Production";
    await Share.share("Freelance redefined by: Take My Tym $urlPreview");
  }

  void launchShare() async {
    await _call();
  }
}
