// api_service.dart (改修版)
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kokorahenn_flutter/api/client/api.dart';
import 'package:kokorahenn_flutter/api/client/app_dio.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/model/response/hotpepper_gourmet_response_result.dart';

import '../../env/env.dart';
import 'location_service.dart';

class ApiService {
  final HotpepperApiClient hotpepperClient = HotpepperApiClient(AppDio());
  final LocationService locationService = LocationService(); // 追加

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
