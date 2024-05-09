// ignore_for_file: avoid_print

import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef PositionCallback = Function(Position position);

class GPS {
  late StreamSubscription<Position> _positionStream;

  bool isAccessGrandted(LocationPermission permission) {
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (isAccessGrandted(permission)) {
      return true;
    }
    permission = await Geolocator.requestPermission();
    return isAccessGrandted(permission);
  }

  Future<void> startPositionStream(PositionCallback callback) async {
    bool permissionGrandted = await requestPermission();
    if (!permissionGrandted) {
      throw Exception("User did not grant GPS permissions.");
    }
    _positionStream = Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.bestForNavigation))
        .listen((callback));
  }

  Future<void> stopPositionStream() async {
    await _positionStream.cancel();
  }
}

class MapsProvider extends ChangeNotifier {
  final GPS _gps = GPS();
  Position? _userposition;
  Position? get userPosition => _userposition;

  GoogleMapController? _mapController;
  GoogleMapController? get mapController => _mapController;

  void handlePositionStream(Position position) {
    _userposition = position;

    if (_mapController != null && _userposition != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(_userposition!.latitude, _userposition!.longitude),
        ),
      );
    }

    notifyListeners();
  }

  void initializeMapController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  Future<void> startPositionStream() async {
    try {
      await _gps.startPositionStream(handlePositionStream);
    } catch (e) {
      print("Error starting position stream: $e");
    }
    notifyListeners();
  }

  Future<void> stopPositionStream() async {
    try {
      await _gps.stopPositionStream();
    } catch (e) {
      print("Error stopping position stream: $e");
    }
    notifyListeners();
  }
}
