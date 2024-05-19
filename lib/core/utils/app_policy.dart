import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class AppPolicyUtil{
    Future<void> launchPrivacyPolicy() async {
    await _launchPrivacyPolicy();
  }

  Future<void> _launchPrivacyPolicy() async {
    final Uri url = Uri.parse(
        'https://doc-hosting.flycricket.io/take-my-tym-privacy-policy/035473c2-09cf-404c-a3a8-3dd036775094/privacy');

    try {
      await launchUrl(url);
    } catch (e) {
  log('cant find the email');
    }
  }
      Future<void> launchConditions() async {
    await _termsAndConditions();
  }

  Future<void> _termsAndConditions() async {
    final Uri url = Uri.parse(
        'https://doc-hosting.flycricket.io/take-my-tym-terms-of-use/a566191a-cca8-46cf-a7e2-fc1bc4f805e2/terms');

    try {
      await launchUrl(url);
    } catch (e) {
  log('cant find the email');
    }
  }
}