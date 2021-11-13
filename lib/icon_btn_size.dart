import 'package:flutter/material.dart';

import './constant.dart';

//Icon Size
double kBtmNaviIconSize(BuildContext context) {
  return kdisplayHeight(context) * 0.031;
}

double kSearchIconSize(BuildContext context) {
  return kdisplayWidth(context) * 28 / 375;
}

double kIndicatorDotSize(BuildContext context) {
  return kdisplayHeight(context) * 7 / 812;
}

double kIndicatorVDotSize(BuildContext context) {
  return kdisplayHeight(context) * 12.5 / 812;
}

double kDetailPageIconSize(BuildContext context) {
  return kdisplayHeight(context) * 0.028;
}

double kNoImageIconSize(BuildContext context) {
  return kdisplayHeight(context) * 100 / 812;
}

//ButtonSize
double kCategoryButtonSizedBox(BuildContext context) {
  return kdisplayWidth(context) * 0.025;
}

double kButtonWidth(BuildContext context) {
  return kdisplayWidth(context) * 250 / 375;
}

double kAniBtnWidth(BuildContext context) {
  return kdisplayWidth(context) * 200 / 375;
}

double kButtonHeight(BuildContext context) {
  return kdisplayHeight(context) * 35 / 812;
}

double kAniBtnHeight(BuildContext context) {
  return kdisplayHeight(context) * 50 / 812;
}

double kLinkBtnWidth(BuildContext context) {
  return kdisplayWidth(context) * 165 / 375;
}

double kLinkBtnHeight(BuildContext context) {
  return kdisplayHeight(context) * 45 / 812;
}
double kEndAlarmBtnWidth(BuildContext context) {
  return kdisplayWidth(context) * 340 / 375 ;
}
double kCategorySortBtnHeight (BuildContext context) {
  return kdisplayHeight(context) * 45 / 812;
}
double kCategoryTotalTextBtnHeight (BuildContext context) {
  return kdisplayHeight(context) * 25 / 812;
}