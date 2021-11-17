import 'package:flutter/material.dart';
import 'package:prac/constant.dart';



class CitySelection {
  String? searchKey;
  String? cityName;
  bool isSelected = false;
  CitySelection ({
    this.searchKey,
    this.cityName,
  });

  String throwKey () {
    return searchKey!;
  }

}
