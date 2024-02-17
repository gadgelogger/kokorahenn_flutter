// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:kokorahenn_flutter/model/dto/shop.dart';

part 'hotpepper_gourmet_response.freezed.dart';
part 'hotpepper_gourmet_response.g.dart';

@freezed
class HotpepperGourmetResponse with _$HotpepperGourmetResponse {
  factory HotpepperGourmetResponse({
    @Default('') String apiVersion,
    @Default(0) int resultsAvailable,
    @Default('') String resultsReturned,
    @Default(0) int resultsStart,
    required List<Shop> shop,
  }) = _HotpepperGourmetResponse;

  factory HotpepperGourmetResponse.fromJson(Map<String, dynamic> json) =>
      _$HotpepperGourmetResponseFromJson(json);
}
