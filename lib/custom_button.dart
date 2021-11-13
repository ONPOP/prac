// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import './constant.dart';
import './font_size.dart';
import './icon_btn_size.dart';


class CustomButton extends StatelessWidget {
  final String btnTitle;
  bool? isDisabled;
  dynamic btnFunction; //Actions if button is clicked
  CustomButton({
    Key? key,
    required this.btnFunction,
    required this.btnTitle,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnFunction,
      child: Container(
        width: kButtonWidth(context),
        height: kButtonHeight(context),
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadiusDirectional.circular(50),
        ),
        child: Center(
          child: Text(
            btnTitle,
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: kButtonFontSize(context)
                // widget.mediaSize.height * 0.003,
                ),
          ),
        ),
      ),
    );
  }
}
