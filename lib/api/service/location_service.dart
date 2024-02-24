// location_service.dart

// Package imports:
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// FIX: 1ファイルに処理のレイヤーが違うクラスを書くのは不適切なのでファイルを分けてください。ファイル名と、そこで管理するクラス名を揃えるように。

class LocationService {
  Future<Position> getCurrentPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return Geolocator.getCurrentPosition();
  }
}

// Provider
class LocationNotifier with ChangeNotifier {
  Position? _currentUserPosition;

  Position? get currentUserPosition => _currentUserPosition;

  Future<void> fetchCurrentUserPosition() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    notifyListeners(); // Listenersに変更を通知
  }
}

// 現在地からの距離を計算する関数
// TOOD: パラメーターで渡す際に全て0として扱うロジックがあるなら、
// このメソッド自体はuserPositionとshopを受け取って処理する or それぞれの変数自体nullableにしてこのメソッドでnullのハンドリングをするのがいいかも
String calculateDistance(
  double userLatitude,
  double userLongitude,
  double shopLatitude,
  double shopLongitude,
) {
  const earthRadius = 6371; // in kilometers

  final lat1 = userLatitude * pi / 180;
  final lon1 = userLongitude * pi / 180;
  final lat2 = shopLatitude * pi / 180;
  final lon2 = shopLongitude * pi / 180;

  final dlon = lon2 - lon1;
  final dlat = lat2 - lat1;

  final a =
      pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  final distance = earthRadius * c;

  if (distance >= 1) {
    return '${distance.toStringAsFixed(1)}km';
  } else {
    final meters = (distance * 1000).toInt();
    return '$meters m';
  }
}
