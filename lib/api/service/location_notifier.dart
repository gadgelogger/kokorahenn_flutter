import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class LocationNotifier with ChangeNotifier {
  Position? _currentUserPosition;

  Position? get currentUserPosition => _currentUserPosition;

  Future<void> fetchCurrentUserPosition() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    notifyListeners();
  }
}

final locationNotifierProvider =
    ChangeNotifierProvider((ref) => LocationNotifier());
