// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:kokorahenn_flutter/model/response/hotpepper_gourmet_response.dart';

part 'hotpepper_gourmet_response_result.freezed.dart';
part 'hotpepper_gourmet_response_result.g.dart';

@freezed
class HotpepperGourmetResponseResult with _$HotpepperGourmetResponseResult {
  factory HotpepperGourmetResponseResult({
    required HotpepperGourmetResponse results,
  }) = _HotpepperGourmetResponseResult;
  factory HotpepperGourmetResponseResult.fromJson(Map<String, dynamic> json) =>
      _$HotpepperGourmetResponseResultFromJson(json);
}
