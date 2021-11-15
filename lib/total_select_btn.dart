import 'package:flutter/material.dart';
import 'package:prac/constant.dart';

class TotalSelectBtn extends StatefulWidget {
  bool isTotal;
  bool isSelected;
  String country;
  TotalSelectBtn(this.country, this.isTotal, this.isSelected, {Key? key}) : super(key: key);

  @override
  _TotalSelectBtnState createState() => _TotalSelectBtnState();
}

class _TotalSelectBtnState extends State<TotalSelectBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isTotal != widget.isTotal;
        widget.isSelected = widget.isSelected;
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
