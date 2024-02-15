// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:http/http.dart' as http;
// Project imports:
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/model/response/hotpepper_gourmet_response.dart';

import '../env/env.dart';

String apiKey = Env.key;

class ShopService {
  final Uri url = Uri.parse(
    'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=$apiKey&large_area=Z011&format=json',
  );

  Future<List<Shop>> getAllShops() async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      debugPrint('Error: ${response.statusCode}');
      return <Shop>[];
    }

    try {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final responseData = HotpepperGourmetResponse.fromJson(
        jsonResponse['results'] as Map<String, dynamic>,
      );
      return responseData.shop;
    } on Exception catch (e) {
      debugPrint('Error: $e');
      return <Shop>[];
    }
  }
}
