// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotpepper_gourmet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotpepperGourmetResponseImpl _$$HotpepperGourmetResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HotpepperGourmetResponseImpl(
      apiVersion: json['api_version'] as String,
      resultsAvailable: json['results_available'] as int,
      resultsReturned: json['results_returned'] as String,
      resultsStart: json['results_start'] as int,
      shop: (json['shop'] as List<dynamic>)
          .map((e) => Shop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HotpepperGourmetResponseImplToJson(
        _$HotpepperGourmetResponseImpl instance) =>
    <String, dynamic>{
      'api_version': instance.apiVersion,
      'results_available': instance.resultsAvailable,
      'results_returned': instance.resultsReturned,
      'results_start': instance.resultsStart,
      'shop': instance.shop.map((e) => e.toJson()).toList(),
    };
