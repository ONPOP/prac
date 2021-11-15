// import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'package:provider/provider.dart';

import './b.dart';
import './constant.dart';
import './store_data.dart';
import './font_size.dart';
import './location_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoreDetail()),
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
        Provider.of<LocaitonProvider>(context).fetchAndSetLocation().then((_) {
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
    // print(extractedData[0].state);
    print(extractedData[0].state); // => 서울
    print(extractedData[0].sublist![0]['key']); // => A-1
    print(extractedData[0].sublist![0]['value']); // => 강남구

    // final statusData = extractedData.map((region) => region.state).toList();
    // final cityKeyData = extractedData.map((region) => region.sublist).toList();
    var btnStyle = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontSize: kCategoryBtnFontSize(context));
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: kMainColor,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.where_to_vote_outlined,
                  size: kdisplayHeight(context) * 13.5 / 812,
                ),
              ),
              //Calendar 초기값
              Text('전체지역'),
            ],
          ),
          onPressed: () async {
            var selectedLocation = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: Platform.isIOS
                          ? kdisplayHeight(context) * 0.545
                          : kdisplayHeight(context) * 0.59,
                      // child: regionBox(statusData[0]!),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  Widget btn(){
    return Container(
      decoration: BoxDecoration(
        
      ),
      child: Text(''),
    );
  }

  // Widget regionBox(String state) {
  //   return Column(
  //     children: <Widget>[
  //       Container(
  //         child: Text(state),
  //       ),
  //       GridView.builder(
  //         gridDelegate:
  //             SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: kdisplayHeight(context) * 300 / 812),
  //         itemBuilder: (context, index) {
  //           return;
  //         },
  //       ),
  //     ],
  //   );
  // }

}
