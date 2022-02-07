/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../enums.dart';

class MenuInfo extends ChangeNotifier {
  late MenuType menuType;
  late String title;
  late IconData icon;

  MenuInfo(this.menuType, {this.title = "", required this.icon});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.icon = menuInfo.icon;

//Important
    notifyListeners();
  }
}
*/