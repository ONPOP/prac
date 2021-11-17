// import 'dart:io';
// // import 'dart:async';
// import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// import 'package:provider/provider.dart';

// import './b.dart';
// import './constant.dart';
// import './store_data.dart';
// import './font_size.dart';
// import './location_provider.dart';
// import 'country_select_btn.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // ChangeNotifierProvider(create: (context) => StoreDetail()),
//         ChangeNotifierProvider(create: (context) => LocaitonProvider()),
//       ],
//       child: MaterialApp(
//         title: 'ajskl',
//         home: Home(),
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var _isInit = true;
//   var _isLoading = false;
//   List<CitySelection> selectedCity = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     if (mounted) {
//       if (_isInit) {
//         setState(() {
//           _isLoading = true;
//         });
//         Provider.of<LocaitonProvider>(context, listen: false)
//             .fetchAndSetLocation()
//             .then((_) {
//           setState(() {
//             _isLoading = false;
//           });
//         });
//       }
//       _isInit = false;
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = Provider.of<LocaitonProvider>(context, listen: false);
//     final extractedData = data.items;
//     List<CitySelection> _citySelection = [];
//     List<String> _state = [];
//     // print(extractedData);
//     extractedData.forEach((state) {
//       _state.add(state.state!);
//       state.sublist!.forEach((city) {
//         _citySelection.add(
//           CitySelection(
//             cityName: city['value'],
//             searchKey: city['key'],
//           ),
//         );
//       });
//     });
//     // print(_state[0]);
//     // print(_citySelection[0].cityName);
//     var btnStyle = Theme.of(context)
//         .textTheme
//         .button!
//         .copyWith(fontSize: kCategoryBtnFontSize(context));
//     return Scaffold(
//       appBar: AppBar(title: const Text('data')),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.50,
//           mainAxisExtent: MediaQuery.of(context).size.width * 0.40,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//         ),
//         itemBuilder: (ctx, index) {
//           return citySelectionBtn(_citySelection[index].cityName!, _citySelection[index].searchKey!, _citySelection[index].isSelected);
//         },
//         itemCount: _citySelection.length,
//       ),
//     );
//   }

//   // Widget stateContainer(String state, List<dynamic> cityAndKey) {
//   //   bool isSelected = false;
//   //   return SizedBox(
//   //     height: 200,
//   //     child: Column(
//   //       children: <Widget>[
//   //         Container(
//   //           child: Text(state),
//   //         ),
//   //         GridView.builder(
//   //           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//   //             maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.70,
//   //           ),
//   //           itemBuilder: (context, index) {
//   //             return citySelectionBtn(cityAndKey[index], isSelected);
//   //           },
//   //           itemCount: cityAndKey.length,
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget citySelectionBtn(String cityName, String cityKey, bool isSelected) {
//     // bool isSelected = false;
//     return GestureDetector(
//       onTap: () {
//         selectedCity.add(CitySelection(searchKey: cityKey, cityName: cityName));
//         // CitySelection().toggleCity();
//         setState(() {
//         isSelected != isSelected;
//         print(isSelected);
//         });
//       },
//       child: Container(
//         height: 10,
//         decoration: BoxDecoration(
//           color: isSelected ? kMainColor : Colors.white,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Center(
//           child: Text(
//             cityName,
//             textAlign: TextAlign.center,
//             style: TextStyle(color: isSelected ? Colors.white : Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }
