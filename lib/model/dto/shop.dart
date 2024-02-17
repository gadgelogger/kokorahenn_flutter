// ignoreForFile: non_constant_identifierNames

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
class Shop with _$Shop {
  factory Shop({
    String? id,
    String? name,
    String? logoImage,
    String? nameKana,
    String? address,
    String? stationName,
    int? ktaiCoupon,
    Area? largeServiceArea,
    Area? serviceArea,
    Area? largeArea,
    Area? middleArea,
    Area? smallArea,
    double? lat,
    double? lng,
    Genre? genre,
    Genre? subGenre,
    Budget? budget,
    int? capacity,
    String? access,
    String? mobileAccess,
    Urls? urls,
    Photo? photo,
    String? open,
    String? close,
    int? partyapacity,
    String? otherMemo,
    String? shopDetailMemo,
    String? budgetMemo,
    String? wedding,
    String? course,
    String? freeDrink,
    String? freeFood,
    String? privateRoom,
    String? horigotatsu,
    String? tatami,
    String? card,
    String? nonSmoking,
    String? charter,
    String? parking,
    String? barrierFree,
    String? show,
    String? karaoke,
    String? band,
    String? tv,
    String? lunch,
    String? midnight,
    String? english,
    String? pet,
    String? child,
    String? wifi,
    CouponUrls? couponUrls,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}

@freezed
class Area with _$Area {
  factory Area({
    String? code,
    String? name,
  }) = _Area;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}

@freezed
class Genre with _$Genre {
  factory Genre({
    String? name,
    String? code,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class Budget with _$Budget {
  factory Budget({
    String? code,
    String? name,
    String? average,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
}

@freezed
class Urls with _$Urls {
  factory Urls({
    String? pc,
  }) = _Urls;

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
}

@freezed
class Photo with _$Photo {
  factory Photo({
    Pc? pc,
    Mobile? mobile,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
class Pc with _$Pc {
  factory Pc({
    String? l,
    String? m,
    String? s,
  }) = _Pc;

  factory Pc.fromJson(Map<String, dynamic> json) => _$PcFromJson(json);
}

@freezed
class Mobile with _$Mobile {
  factory Mobile({
    String? l,
    String? s,
  }) = _Mobile;

  factory Mobile.fromJson(Map<String, dynamic> json) => _$MobileFromJson(json);
}

@freezed
class CouponUrls with _$CouponUrls {
  factory CouponUrls({
    String? pc,
    String? sp,
  }) = _CouponUrls;

  factory CouponUrls.fromJson(Map<String, dynamic> json) =>
      _$CouponUrlsFromJson(json);
}
