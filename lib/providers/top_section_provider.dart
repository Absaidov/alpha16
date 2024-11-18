import 'package:flutter/material.dart';

class TopSectionProvider extends ChangeNotifier {
  bool activity = true;

  void toogleActivity(bool toogle) {
    if (toogle != activity) {
      activity = toogle;
      notifyListeners();
    }
  }
}
