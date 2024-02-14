import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kokorahenn_flutter/model/shop.dart'; // モデルのインポートパスを適切に設定してください

class ShopService {
  final Uri url = Uri.parse(
    'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=f0496b62486794fc&large_area=Z011&format=json',
  );

  Future<List<Shop>> getAllShops() async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      debugPrint('Error: ${response.statusCode}');
      return <Shop>[];
    }

    final jsonResponse = jsonDecode(response.body);
    if (jsonResponse is Map<String, dynamic>) {
      final results = jsonResponse['results'];
      if (results is Map<String, dynamic>) {
        final shopsJson = results['shop'];
        if (shopsJson is List<dynamic>) {
          final shops = shopsJson.map((shopJson) {
            if (shopJson is Map<String, dynamic>) {
              return Shop.fromJson(shopJson);
            } else {
              debugPrint('shopJson is not a Map<String, dynamic>');
              return Shop();
            }
          }).toList();
          return shops;
        }
      }
    }
    return <Shop>[];
  }
}
