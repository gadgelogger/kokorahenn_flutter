// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:http/http.dart' as http;
import 'package:kokorahenn_flutter/env/env.dart';
// Project imports:
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/model/response/hotpepper_gourmet_response_result.dart';

class ShopService {
  final String apiKey = Env.key;

  Future<List<Shop>> getAllShops(
    double latitude,
    double longitude,
  ) async {
    final url = Uri.parse(
      'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=$apiKey&format=json&lat=$latitude&lng=$longitude&range=5',
    );
    final response = await http.get(url);

    if (response.statusCode != 200) {
      debugPrint('Error: ${response.statusCode}');
      return <Shop>[];
    }

    try {
      debugPrint('Response: ${url}');
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final results = HotpepperGourmetResponseResult.fromJson(jsonResponse);
      return results.results.shop;
    } on Exception catch (e) {
      debugPrint('Error: $e');
      return <Shop>[];
    }
  }
}

// // retrofit
// @GET('')
// Future<HotpepperGourmetResponseResult> fetchHotpepperInfo({
//   @Query('key') String apiKey,
//   @Query('format') String format,
//   @Query('lat') int latitude,
//   @Query('lng') int longitude,
//   @Query('range') int range,
// });

// // 改善後
// Future<List<Shop> fetchShopList() async {
//   try {
//     final response = await fetchHotpepperInfo(
//       apiKey: 'fbf9b9be8fecf32a',
//       format: 'json',
//       latitude: 35.658034,
//       longitude: 139.701636,
//       range: 3,
//     );
//     return response.results.shop;
//   } on Exception catch (e) {
//     debugPrint('Error: $e');
//     return <Shop>[];
//   }
// }
