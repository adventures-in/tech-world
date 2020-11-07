import 'dart:io';

import 'package:adventures_in_tech_world/enums/platform/platform_enum.dart';
import 'package:adventures_in_tech_world/utils/git_hub_redirect.dart'
    as git_hub_redirect;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class PlatformService {
  PlatformService();

  PlatformEnum detectPlatform() {
    if (kIsWeb) {
      return PlatformEnum.web;
    }
    if (Platform.isMacOS) {
      return PlatformEnum.macOS;
    }
    if (Platform.isFuchsia) {
      return PlatformEnum.fuchsia;
    }
    if (Platform.isLinux) {
      return PlatformEnum.linux;
    }
    if (Platform.isWindows) {
      return PlatformEnum.windows;
    }
    if (Platform.isIOS) {
      return PlatformEnum.iOS;
    }
    if (Platform.isAndroid) {
      return PlatformEnum.android;
    }
    return PlatformEnum.unknown;
  }

  Future<void> redirectWithState(String state) async {
    final url = git_hub_redirect.uriWith(state: state).toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> redirectTo(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
