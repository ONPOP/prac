// import 'package:flutter/material.dart';
// import 'package:kakao_flutter_sdk/all.dart';
// import '../screens/selection_dialog.dart';
// import '../widgets/button_selection.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Calendar extends StatefulWidget {
//   const Calendar({Key? key}) : super(key: key);

//   @override
//   State<Calendar> createState() => _CalendarState();
// }

// String baseurl = 'aa';
// String all = 'A-A+B-B';
// String rest = 'bb';

// // CitySelection seoulAll = CitySelection(selected: false);
// // CitySelection otherAll = CitySelection(selected: false);
// // List<CitySelection> seoulGu = [];
// // List<CitySelection> otherGu = [];

// class _CalendarState extends State<Calendar> {
//   List<CitySelection> _Seoulcities = [];
//   List<CitySelection> _Othercities = [];
//   //bool seoulAllSelected = false;
//   List<int> seoulGuSelection = [];
//   bool _isLoading = true;

//   @override
//   void didChangeDependencies() {
//     fetchPost();
//     super.didChangeDependencies();
//   }

//   void fetchStores(storeAddress) async {
//     final String urlBigin =
//         'http://ec2-52-79-166-52.ap-northeast-2.compute.amazonaws.com:9000/v1/api/stores/search/category?start=20210701&end=20220801&lo=';
//     //final String storeAddress;
//     final String urlEnd = '&limit=2';

//     final response =
//         await http.get(Uri.parse(urlBigin + storeAddress + urlEnd));
//     if (response.statusCode == 200) {
//       final extractedCities =
//           jsonDecode(utf8.decode(response.bodyBytes))['response'];
//       print(extractedCities);
//     } else {
//       throw Exception('failed to load data');
//     }
//   }

//   void fetchPost() async {
//     final response = await http.get(Uri.parse(
//         'http://ec2-52-79-166-52.ap-northeast-2.compute.amazonaws.com:9000/v1/api/addressList'));
//     if (response.statusCode == 200) {
//       final extractedCities =
//           jsonDecode(utf8.decode(response.bodyBytes))['response'];

//       extractedCities[0]['sublist'].forEach((seoul) {
//         _Seoulcities.add(
//           CitySelection(
//             selected: false,
//             address: seoul['key'],
//             name: seoul['value'],
//           ),
//         );
//       });
//       extractedCities[1]['sublist'].forEach((other) {
//         _Othercities.add(
//           CitySelection(
//             selected: false,
//             address: other['key'],
//             name: other['value'],
//           ),
//         );
//       });
//       print(_Seoulcities.length);

//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       throw Exception('failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? CircularProgressIndicator()
//         : Scaffold(
//             appBar: AppBar(),
//             body: Column(
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return StatefulBuilder(
//                           builder:
//                               (BuildContext context, StateSetter setState) {
//                             return AlertDialog(
//                                 title: Text('location'),
//                                 content: Container(
//                                   height: 400,
//                                   width: 400,
//                                   child: ListView.builder(
//                                     padding: const EdgeInsets.all(10),
//                                     itemBuilder: (ctx, index) =>
//                                         SelectionButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           if (index == 0) {
//                                             if (seoulGuSelection.isEmpty) {
//                                               _Seoulcities[index]
//                                                   .toggleSelection();
//                                             } else {
//                                               for (int num
//                                                   in seoulGuSelection) {
//                                                 _Seoulcities[num]
//                                                     .toggleSelection();
//                                               }
//                                               seoulGuSelection.clear();
//                                               _Seoulcities[index]
//                                                   .toggleSelection();
//                                             }
//                                           } else {
//                                             if (_Seoulcities[0].selected) {
//                                               _Seoulcities[0].toggleSelection();
//                                               if (!_Seoulcities[index]
//                                                   .selected) {
//                                                 seoulGuSelection.add(index);
//                                                 _Seoulcities[index]
//                                                     .toggleSelection();
//                                               } else {
//                                                 seoulGuSelection.removeWhere(
//                                                     (element) =>
//                                                         element == index);
//                                                 _Seoulcities[index]
//                                                     .toggleSelection();
//                                               }
//                                             } else {
//                                               if (!_Seoulcities[index]
//                                                   .selected) {
//                                                 seoulGuSelection.add(index);
//                                                 _Seoulcities[index]
//                                                     .toggleSelection();
//                                               } else {
//                                                 seoulGuSelection.removeWhere(
//                                                     (element) =>
//                                                         element == index);
//                                                 _Seoulcities[index]
//                                                     .toggleSelection();
//                                               }
//                                             }
//                                           }
//                                         });
//                                       },
//                                       buttonClicked:
//                                           _Seoulcities[index].selected,
//                                       text: _Seoulcities[index].name,
//                                     ),
//                                     itemCount: _Seoulcities.length,
//                                   ),
//                                 ),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     child: Text('button'),
//                                     onPressed: () {
//                                       if (_Seoulcities[0].selected) {
//                                         print(
//                                             _Seoulcities[0].address.toString());
//                                         fetchStores(
//                                             _Seoulcities[0].address.toString());
//                                       } else {
//                                         var add = '';
//                                         for (int i = 0;
//                                             i < seoulGuSelection.length - 1;
//                                             i++) {
//                                           add = add +
//                                               _Seoulcities[seoulGuSelection[i]]
//                                                   .address
//                                                   .toString() +
//                                               '+';
//                                         }
//                                         add = add +
//                                             _Seoulcities[seoulGuSelection[
//                                                     seoulGuSelection.length -
//                                                         1]]
//                                                 .address
//                                                 .toString();
//                                         print(add);
//                                         fetchStores(add);
//                                       }
//                                     },
//                                   ),
//                                 ]);
//                           },
//                         );
//                       },
//                     );
//                   },
//                   child: Text(
//                     '전체보기',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   style: ButtonStyle(
//                     backgroundColor: true
//                         ? MaterialStateProperty.all<Color>(Colors.blue)
//                         : MaterialStateProperty.all<Color>(Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }

// class SelectionButton extends StatelessWidget {
//   final String text;
//   bool buttonClicked;
//   Function() onPressed;
//   SelectionButton(
//       {required this.text,
//       required this.buttonClicked,
//       required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: TextStyle(color: Colors.black),
//       ),
//       style: ButtonStyle(
//         backgroundColor: buttonClicked
//             ? MaterialStateProperty.all<Color>(Colors.blue)
//             : MaterialStateProperty.all<Color>(Colors.white),
//       ),
//     );
//   }
// }
