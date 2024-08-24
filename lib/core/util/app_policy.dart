import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

/// Utility class for launching application policies URLs.
///
/// This class provides static methods to launch the privacy policy
/// and terms and conditions URLs in the default web browser.
/// It cannot be instantiated.
class AppPolicyUtil {
  // Private constructor to prevent instantiation.
  AppPolicyUtil._();
 
  /// Launches the privacy policy URL.
  ///
  /// This method attempts to open the privacy policy URL in the default web browser.
  /// If the URL cannot be opened, an error is logged.
  static Future<void> launchPrivacyPolicy() async {
    await _launchPrivacyPolicy();
  }

  /// Internal method to launch the privacy policy URL.
  ///
  /// This method contains the actual implementation for opening the privacy policy URL.
  static Future<void> _launchPrivacyPolicy() async {
    final Uri url = Uri.parse(
        'https://doc-hosting.flycricket.io/take-my-tym-privacy-policy/035473c2-09cf-404c-a3a8-3dd036775094/privacy');

    try {
      await launchUrl(url);
    } catch (e) {
      log('Unable to launch privacy policy URL: $e');
    }
  }

  /// Launches the terms and conditions URL.
  ///
  /// This method attempts to open the terms and conditions URL in the default web browser.
  /// If the URL cannot be opened, an error is logged.
  static Future<void> launchConditions() async {
    await _termsAndConditions();
  }

  /// Internal method to launch the terms and conditions URL.
  ///
  /// This method contains the actual implementation for opening the terms and conditions URL.
  static Future<void> _termsAndConditions() async {
    final Uri url = Uri.parse(
        'https://doc-hosting.flycricket.io/take-my-tym-terms-of-use/a566191a-cca8-46cf-a7e2-fc1bc4f805e2/terms');

    try {
      await launchUrl(url);
    } catch (e) {
      log('Unable to launch terms and conditions URL: $e');
    }
  }
}
