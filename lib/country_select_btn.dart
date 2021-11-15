import 'package:flutter/material.dart';
import 'package:prac/constant.dart';

class CountrySelectBtn extends StatefulWidget {
  bool isTotal;
  bool isSelected;
  String country;
  CountrySelectBtn(this.country, this.isTotal, this.isSelected, {Key? key}) : super(key: key);

  @override
  _CountrySelectBtnState createState() => _CountrySelectBtnState();
}

class _CountrySelectBtnState extends State<CountrySelectBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isTotal = false;
        widget.isSelected != widget.isSelected;
      },
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.isSelected ? kMainColor : Colors.white,
        ),
        child: Text(widget.country),
      ),
    );
  }
}
