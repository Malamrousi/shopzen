import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../app/app_localizations.dart';

class AppInfo {
  static Future<String> getAppInfo(BuildContext context) async {
    var buildNumber = '';
    if (AppLocalizations.of(context)!.locale?.languageCode == "en") {
      final packageInfo = await PackageInfo.fromPlatform();
      buildNumber = "${packageInfo.version} (${packageInfo.buildNumber})";
    }else{
       final packageInfo = await PackageInfo.fromPlatform();
      buildNumber = "${packageInfo.buildNumber} (${packageInfo.version})";
    }
    return buildNumber;
  }
}
