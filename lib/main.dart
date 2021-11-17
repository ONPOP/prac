import 'dart:io';
// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'package:provider/provider.dart';

import './b.dart';
import './constant.dart';
import './store_data.dart';
import './font_size.dart';
import './location_provider.dart';
import 'country_select_btn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => StoreDetail()),
        ChangeNotifierProvider(create: (context) => LocaitonProvider()),
      ],
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
  var _isInit = true;
  var _isLoading = false;
  List<CitySelection> selectedCity = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (mounted) {
      if (_isInit) {
        setState(() {
          _isLoading = true;
        });
        Provider.of<LocaitonProvider>(context, listen: false)
            .fetchAndSetLocation()
            .then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      }
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<LocaitonProvider>(context, listen: false);
    final extractedData = data.items;
    return Scaffold(
      appBar: AppBar(title: const Text('data')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: extractedData[index],
            child: textContainer(extractedData[index]),
          ),
          itemCount: extractedData.length,
        ),
      ),
    );
  }

  Widget textContainer(StateData location) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(location.state!),
          ),
          Wrap(
            children: [
              for (int i = 0; i < location.sublist!.length; i++)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  child: Text(location.sublist![i]['value']),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black),
                  ),
                ),
            ],
          ),
        ]);
  }
}
