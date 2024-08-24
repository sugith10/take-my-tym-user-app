import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class ServiceCenterUtil {
  void _launcCall() async {
    final Uri uri = Uri(scheme: 'tel', path: "7907603014");
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      throw 'Could not launch $uri';
    }
  }

  void launcCall() async {
    _launcCall();
  }

  Future<void> _launchEmail() async {
    const String emailAddress = 'dayproductionltd@gmail.com';
    const String emailSubject = '';
    const String emailBody = '';

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        'subject': emailSubject,
        'body': emailBody,
      },
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      log(e.toString());
    }
  }

 void launchEmail() async {
    await _launchEmail();
  }
}
