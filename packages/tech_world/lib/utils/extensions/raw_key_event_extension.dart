import 'package:flutter/services.dart';

extension RawKeyEventExtension on RawKeyEvent {
  bool get isSpaceDown =>
      this is RawKeyDownEvent && data.logicalKey.keyId == 32;
}
