// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:kokorahenn_flutter/api/client/api.dart';
import 'package:kokorahenn_flutter/api/client/app_dio.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/model/response/hotpepper_gourmet_response_result.dart';

class ApiService {
  final hotpepperClient = HotpepperApiClient(AppDio());

  Future<List<Shop>> fetchShopList() async {
    try {
      final response = await hotpepperClient.fetchHotpepperInfo(
        apiKey: 'fbf9b9be8fecf32a',
        format: 'json',
        latitude: 35.681236,
        longitude: 139.767125,
        range: 3,
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
