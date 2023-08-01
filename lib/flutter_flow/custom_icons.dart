import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _closeFamily = 'Close';

  // MyFlutterApp
  static const IconData kbook =
      IconData(0xe801, fontFamily: _myFlutterAppFamily);
  static const IconData kdashboard =
      IconData(0xe802, fontFamily: _myFlutterAppFamily);

  // close
  static const IconData kepCloseBold =
      IconData(0xe801, fontFamily: _closeFamily);
}
