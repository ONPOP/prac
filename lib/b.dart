// ignore_for_file: use_rethrow_when_possible

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'store_data.dart';

class StoreDetail with ChangeNotifier {
  Store _item = Store(id: null);

  // Future<void>.delayed(Duration.zero, {});
  
  Store get item {
    print('${_item.brandName} = item');
    return _item;
    // return _item!;
  }

  Future<void> fetchAndSetStoreCategory() async {
    var url = 'https://dev-api.onpop.co.kr/v1/api/addressList';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData =
          jsonDecode(utf8.decode(response.bodyBytes))['response']
              as List<dynamic>;
      print(extractedData);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
