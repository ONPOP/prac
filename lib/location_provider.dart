import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Location with ChangeNotifier {
  String? state;
  List? sublist;
  Location({
    this.state,
    this.sublist,
  });
}

class LocaitonProvider with ChangeNotifier {
  List<Location> _items = [];

  List<Location> get items {
    return [..._items];
  }

  Future<void> fetchAndSetLocation() async {
    String url = 'https://dev-api.onpop.co.kr/v1/api/addressList';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData =
          jsonDecode(utf8.decode(response.bodyBytes))['response']
              as List<dynamic>;
      List<Location> locationData = [];
      extractedData.forEach(
        (data) {
          locationData.add(Location(
            state: data['value'],
            sublist: data['sublist'],
          ));
        },
      );
      _items = locationData;
      // List<String> stateList = [];
      // locationData.map((data) {
      //   return stateList.add(data.state!);
      // }).toList();

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
