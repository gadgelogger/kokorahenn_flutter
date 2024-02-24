// api_service.dart (改修版)

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
      // 位置情報の取得
      final position = await locationService.getCurrentPosition();

      // 位置情報を使用したAPIリクエスト
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
