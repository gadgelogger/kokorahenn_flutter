// Package imports:
import 'dart:math';

import 'package:geolocator/geolocator.dart';

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

// 現在地からの距離を計算する関数
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
