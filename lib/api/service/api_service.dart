// FIX: 全体を通じて、相対パス絶対パスの使い分けはある?（統一する）
//絶対パスで統一しました（どっちがいいのだろうか）
// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:kokorahenn_flutter/api/client/api.dart';
import 'package:kokorahenn_flutter/api/client/app_dio.dart';
import 'package:kokorahenn_flutter/env/env.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/model/response/hotpepper_gourmet_response_result.dart';

import 'location_service.dart';

class ApiService {
  final HotpepperApiClient hotpepperClient = HotpepperApiClient(AppDio());
  final LocationService locationService = LocationService();

  Future<List<Shop>> fetchShopList({required int range}) async {
    try {
      final position = await locationService.getCurrentPosition();

      final response = await hotpepperClient.fetchHotpepperInfo(
        apiKey: Env.key,
        format: 'json',
        latitude: position.latitude,
        longitude: position.longitude,
        range: range,
        count: 20,
        start: 1,
      );

      final jsonData = jsonDecode(response) as Map<String, dynamic>;
      final result = HotpepperGourmetResponseResult.fromJson(jsonData);
      return result.results.shop;
    } on Exception catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return [];
    }
  }
}
