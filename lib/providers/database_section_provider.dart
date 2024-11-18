import 'package:flutter/material.dart';

import '../models/dhikr.dart';

class DatabaseSectionProvider extends ChangeNotifier {
  List<Dhikr> fakeDB = [
    Dhikr(123, 'title 1', DateTime.now()),
    Dhikr(234, 'title 2', DateTime.now()),
    Dhikr(546, 'title 3', DateTime.now()),
    Dhikr(789, 'title 4', DateTime.now()),
  ];
  void updateDatabase() {
    notifyListeners();
  }

  void addDhikr(Dhikr dhikr) {
    fakeDB.add(dhikr);
    notifyListeners();
  }

  void updateDhikr(int index, Dhikr newDhikr) {
    fakeDB[index] = newDhikr;
    notifyListeners();
  }

  void removeDhikr(int index) {
    fakeDB.removeAt(index);
    notifyListeners();
  }
}
