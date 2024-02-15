import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';

part 'hotpepper_gourmet_response.freezed.dart';
part 'hotpepper_gourmet_response.g.dart';

@freezed
class HotpepperGourmetResponse with _$HotpepperGourmetResponse {
  factory HotpepperGourmetResponse({
    required String apiVersion,
    required int resultsAvailable,
    required String resultsReturned,
    required int resultsStart,
    required List<Shop> shop,
  }) = _HotpepperGourmetResponse;

  factory HotpepperGourmetResponse.fromJson(Map<String, dynamic> json) =>
      _$HotpepperGourmetResponseFromJson(json);
}
