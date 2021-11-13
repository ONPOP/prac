import 'package:flutter/material.dart';

//Screen Size
Size kdisplaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double kdisplayWidth(BuildContext context) {
  return kdisplaySize(context).width;
}

double kdisplayHeight(BuildContext context) {
  return kdisplaySize(context).height;
}

double kMiddleDisplayHeight(BuildContext context) {
  return kdisplayHeight(context) - MediaQuery.of(context).padding.top;
}

//Appbar Logo Size
double kLogoWidth(BuildContext context) {
  return kdisplayWidth(context) * 100 / 375;
}

double kLogoHeight(BuildContext context) {
  return kdisplayHeight(context) * 30 / 812;
}



//Widget Size
double kMainListHeight(BuildContext context) {
  return kdisplayHeight(context) * 270 / 812;
}

double kDetailPageInfoHeight(BuildContext context) {
  return kdisplayHeight(context) * 200 / 812;
}

double kDetailPageAppbarHeight(BuildContext context) {
  return kMiddleDisplayHeight(context) * 0.06;
}
double kDetailSubInfoHeight(BuildContext context) {
  return kdisplayHeight(context) * 27 / 812;
}

//Padding
double kMainListVerticalPadding(BuildContext context) {
  return kdisplayHeight(context) * 0.0025;
}

double kMainListHorizontalPadding(BuildContext context) {
  return kdisplayHeight(context) * 0.015;
}

double kAniBtnPadding(BuildContext context) {
  return kdisplayWidth(context) * 15 / 375;
}

double kTabbarTitleHorizontalPadding(BuildContext context) {
  return kdisplayWidth(context) * 10 / 375;
}

//Margin
double kCategoryButtonLeftMargin(BuildContext context) {
  return kdisplayWidth(context) * 0.055;
}

double kCategoryButtonTopMargin(BuildContext context) {
  return kdisplayHeight(context) * 0.015;
}

//Image Size
double kBannerImageHeight(BuildContext context) {
  return kdisplayHeight(context) * 480 / 812;
}

double kMainListImageHeight(BuildContext context) {
  return kdisplayHeight(context) * 199 / 812;
}

double kStoreImageHeight(BuildContext context) {
  return kdisplayHeight(context) * 375.25 / 812; //가로 세로 390
}



//Positioned
double kAniBtnBtmPositioned(BuildContext context) {
  return kdisplayHeight(context) * 40 / 812;
}

double kAniBtnRightPositioned(BuildContext context) {
  return kdisplayWidth(context) * 30 / 375;
}

double kInfoStackPosition(BuildContext context) {
  return kdisplayHeight(context) * 5 / 812;
}

double kIndicatorPositionTop(BuildContext context) {
  return kdisplayHeight(context) * 310 / 812;
}

double kIndicatorPositionBottom(BuildContext context) {
  return kdisplayHeight(context) * 16 / 812;
}

double kIndicatorPositionRight(BuildContext context) {
  return kdisplayWidth(context) * 10 / 375;
}

//Color
const kMainColor = Color(0xFF00A591);
const kMainColorOpacity65 = Color(0xA600A591); // 65% opacity
const kMainColorOpacity25 = Color(0x4000A591); // 25% opacity
const kSubInfoColor = Color(0xFF808080);
const kSubInfoColorOpacity = Color(0xCC808080);
