
import 'package:flutter/material.dart';

import './constant.dart';
import './font_size.dart';
import './icon_btn_size.dart';
import './custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ajskl',
      home: PeriodSortBtn(),
    );
  }
}

class PeriodSortBtn extends StatefulWidget {
  const PeriodSortBtn({Key? key}) : super(key: key);
  @override
  State<PeriodSortBtn> createState() => _PeriodSortBtnState();
}

class _PeriodSortBtnState extends State<PeriodSortBtn> {
  Map<String, List>? _selectedLocation;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    var btnStyle = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontSize: kCategoryBtnFontSize(context));

    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          maximumSize: Size(kdisplayWidth(context) * 70 / 312, double.infinity),
          primary:
              _selectedLocation == null ? kSubInfoColorOpacity : kMainColor,
        ),
        child: _selectedLocation == null
            ? Text('전체지역', style: btnStyle)
            : Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.where_to_vote_outlined,
                      size: kdisplayHeight(context) * 13.5 / 812,
                    ),
                  ),
                  Text('${_selectedLocation!.values}',
                      overflow: TextOverflow.ellipsis),
                ],
              ),
        onPressed: () async {
          var selectedCity = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.85,
                  // height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.where_to_vote_outlined,
                              size: kdisplayHeight(context) * 20 / 812,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontSize: kBrandNameFontSize(context),
                                  color: Colors.black),
                            ),
                            Expanded(child: SizedBox()),
                            GestureDetector(
                              child: Icon(Icons.close),
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey, thickness: 2),

                      //지역 설정하기
                      Container(
                          margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              cityText('서울특별시'),
                              locationBtnGridView(),
                              cityText('경기도'),
                              // locationBtn(),
                              cityText('인천광역시'),
                              // locationBtn(),
                            ],
                          )),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomButton(
                          btnFunction: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          btnTitle: '검색 결과 보러가기',
                        ),
                      )
                    ],
                  ),
                ));
              });
        },
      ),
    );
  }

  Widget cityText(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(title, style: TextStyle(fontSize: 18)),
    );
  }

  Widget locationBtn(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = true;
          // _selectedLocation.forEach((key, value) => ).
        });
      },
      child: Container(
        color: _isSelected ? Colors.green : Colors.white,
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: Text(
          title,
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget locationBtnGridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      children: <Widget>[
        locationBtn('강남구/서초구'),
        locationBtn('마포구/서대문구'),
        locationBtn('종로구/용산구'),
        locationBtn('영등포구/구로구'),
        locationBtn('동대문구/중랑구'),
        locationBtn('성동구/광진구'),
        locationBtn('송파구/강동구'),
      ],
    );
  }
}
