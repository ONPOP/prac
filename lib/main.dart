import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import './b.dart';
import './store_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => StoreDetail())],
      child: MaterialApp(
        title: 'ajskl',
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    StoreDetail().fetchAndSetStoreCategory();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print(DateFormat('yyyy-MM-dd').format(DateTime.parse('20211010')));
    // String date = DateFormat('yyyyMMdd').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text('data')),
    );
  }
}
