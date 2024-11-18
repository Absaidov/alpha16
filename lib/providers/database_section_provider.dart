import 'package:flutter/material.dart';

import '../models/dhikr.dart';

class DatabaseSectionProvider extends ChangeNotifier {
  List<Dhikr> fakeDataBase = [
    Dhikr(123, 'title 1', DateTime.now()),
    Dhikr(234, 'title 2', DateTime.now()),
    Dhikr(546, 'title 3', DateTime.now()),
    Dhikr(789, 'title 4', DateTime.now()),
  ];
  void updateDatabase() {
    notifyListeners();
  }
}
