import 'package:share_plus/share_plus.dart';

/// A utility class for sharing application content using the `share_plus` package.
class ShareAppUtil {
  Future<void> _call() async {
    const urlPreview =
        "https://www.amazon.in/dp/B0D4M1GMNG/ref=sr_1_1?crid=2DEDN6AFIFTVR&dib=eyJ2IjoiMSJ9.CgJxBSWe4x6tWLjZokwDBw.VJCRnsHfF0ple8fz_Ktg2HRM4tFwFTQl68U7W65He2k&dib_tag=se&keywords=Take+My+Tym&qid=1716279032&s=mobile-apps&sprefix=take+my+ty%2Cmobile-apps%2C235&sr=1-1";
    await Share.share("Freelance redefined by: Take My Tym $urlPreview");
  }

  /// Application share link
  void launchShare() async {
    await _call();
  }
}
