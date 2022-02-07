import 'package:flutter/material.dart';

class Palette {
  static MaterialColor kToDark = const MaterialColor(
    0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff446c77), //10%
      100: Color(0xff3d606a), //20%
      200: Color(0xff35545c), //30%
      300: Color(0xff2e484f), //40%
      400: Color(0xff263c42), //50%
      500: Color(0xff4C7884), //60%
      600: Color(0xff172428), //70%
      700: Color(0xff0f181a), //80%
      800: Color(0xff080c0d), //90%
      900: Color(0xff000000), //100%
    },
  );
}
