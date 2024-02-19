// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
class Shop with _$Shop {
  factory Shop({
    String? name,
    String? logoImage,
    String? address,
    double? lat,
    double? lng,
    Genre? genre,
    int? capacity,
    String? access,
    Urls? urls,
    Photo? photo,
    String? open,
    String? close,
    String? otherMemo,
    String? shopDetailMemo,
    String? course,
    String? freeDrink,
    String? freeFood,
    String? card,
    Budget? budget,
    String? nonSmoking,
    String? parking,
    String? barrierFree,
    String? lunch,
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
