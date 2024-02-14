import 'package:freezed_annotation/freezed_annotation.dart';

part 'restrant.freezed.dart';
part 'restrant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    String? id,
    String? name,
    String? address,
    String? tel,
    String? latitude,
    String? longitude,
    String? genre,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
