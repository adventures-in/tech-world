import 'dart:io';

class PlatformWrapper {
  bool get isIOS => Platform.isIOS;
  bool get isAndroid => Platform.isAndroid;
  bool get isMacOS => Platform.isMacOS;

  const PlatformWrapper();
}
