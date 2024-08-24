package com.dayproduction.take_my_tym

import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
  private val CHANNEL = "app_version"

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == "getAppVersion") {
        try {
          val pInfo = this.packageManager.getPackageInfo(packageName, 0)
          val version = pInfo.versionName
          result.success(version)
        } catch (e: Exception) {
          result.error("UNAVAILABLE", "App version not available.", null)
        }
      } else {
        result.notImplemented()
      }
    }
  }
}
