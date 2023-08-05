import 'package:flutter/material.dart';
import 'package:globalchat_flutter/util/constants.dart';

class Styles {
  static var COLOR_BACKGROUND = const Color(0xFFBFE8BC);
  static var COLOR_MAIN = const Color(0xFF48BF53);
  static var COLOR_MAIN_TEXT = const Color(0xFF11813B);
  static var COLOR_HINT_TEXT = const Color(0xFF7B9691);
  static var COLOR_TITLE = const Color(0xFF02231C);
  static var COLOR_TEXT = const Color(0xFF273834);
  static var COLOR_TEXT_BACKGROUND = const Color(0x32273834);

  static void switchTheme(bool isDark) {
    COLOR_BACKGROUND = isDark ? const Color(0xFF273834) : const Color(0xFFBFE8BC);
    COLOR_MAIN = isDark ? const Color(0xFF004707) : const Color(0xFF48BF53);
    COLOR_MAIN_TEXT = const Color(0xFF11813B);
    COLOR_HINT_TEXT = const Color(0xFF7B9691);
    COLOR_TITLE = const Color(0xFF02231C);
    COLOR_TEXT = const Color(0xFF273834);
    COLOR_TEXT_BACKGROUND = const Color(0x32273834);
  }
}
