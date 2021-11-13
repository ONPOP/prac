import 'package:flutter/material.dart';

class Store with ChangeNotifier{
  dynamic id;
  final String? brandName;
  final String? openDate;
  final String? endDate;
  // final Map<String,dynamic>? storeAddress;
  final String? state;
  final String? city;
  final String? country;
  final String? detailAddress;
  final String? roadAddress;
  final String? openTime;
  final String? closeTime;
  final String? listImageUrl;
  final String? subInfo;
  final List<dynamic>? brandImageUrl;
  final List<dynamic>? options;
  final String? shoppingLink;
  final String? reservationLink;
  final List<dynamic>? storeImageUrl;
  final double? longitude;
  final double? latitude;
  final bool? requireBooked;
  final bool? partnerBrand;
  final bool? putWishList;
  final Map<String,String>? noticeList;
  final String? bannerImageUrl;


  Store({
    required this.id,
    this.openDate,
    this.endDate,
    // this.storeAddress,
    this.state,
    this.city,
    this.country,
    this.detailAddress,
    this.roadAddress,
    this.brandName,
    this.openTime,
    this.closeTime,
    this.listImageUrl,
    this.subInfo,
    this.brandImageUrl,
    this.options,
    this.shoppingLink,
    this.reservationLink,
    this.storeImageUrl,
    this.longitude,
    this.latitude,
    this.requireBooked,
    this.partnerBrand,
    this.putWishList,
    this.noticeList,
    this.bannerImageUrl,
  });
}
