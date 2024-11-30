import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/dhikr.dart';

class DatabaseSectionProvider extends ChangeNotifier {
  late Box<Dhikr> box;
  Future<void> openDhikrBox() async {
    box = await Hive.openBox('dhikrs');
  }

  void addDhikr(Dhikr dhikr) {
    box.add(dhikr);
    notifyListeners();
  }

  void removeDhikr(int index) {
    box.delete(index);
    notifyListeners();
  }

  void updateDhikr(int index, Dhikr newDhikr) {
    box.putAt(index, newDhikr);
    notifyListeners();
  }

  void updateDatabase() {
    notifyListeners();
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }
}
