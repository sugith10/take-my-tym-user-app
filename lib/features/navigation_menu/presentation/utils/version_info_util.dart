import 'package:flutter/services.dart';

class VersionInfoUtil {
  VersionInfoUtil._();
  static const MethodChannel _channel = MethodChannel("app_version");

  static Future<String?> get appVersion async {
    final String? version = await _channel.invokeMethod('getAppVersion');
    return version;
  }
}
