import 'package:flutter/material.dart';

class CitySelection with ChangeNotifier {
  bool selected = false;
  String address;
  String name;

  CitySelection(
      {required this.selected, required this.address, required this.name});

  void toggleSelection() {
    selected = !selected;
    notifyListeners();
  }
}
