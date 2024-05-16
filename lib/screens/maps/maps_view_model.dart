import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sehatjantungku/model/maps_model.dart';
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

class MapsViewModel extends ChangeNotifier {
  final GPS _gps = GPS();
  Position? _userposition;
  Position? get userPosition => _userposition;
  BitmapDescriptor? markerIcon;
  List<Marker> _hospitalMarkers = [];
  List<Marker> get hospitalMarkers => _hospitalMarkers;
  final MapsModel mapsModel = MapsModel();

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
      if (kDebugMode) {
        print("Error starting position stream: $e");
      }
    }
    notifyListeners();
  }

  Future<void> stopPositionStream() async {
    try {
      await _gps.stopPositionStream();
    } catch (e) {
      if (kDebugMode) {
        print("Error stopping position stream: $e");
      }
    }
    notifyListeners();
  }

  void addCustomIcon() async {
    try {
      final icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        'assets/blue_dot.png',
      );
      markerIcon = icon;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Errorr loading custom icon: $e");
      }
    }
  }

  void addHospitalMarkers(List<String> hospitalCoordinates) {
    List<Marker> hospitalMarkers = [];

    for (var coordinate in hospitalCoordinates) {
      List<String> parts = coordinate.split(', ');
      double latitude = double.parse(parts[0]);
      double longitude = double.parse(parts[1]);

      Marker marker = Marker(
        markerId: MarkerId(coordinate),
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: 'Hospital'),
      );

      hospitalMarkers.add(marker);
    }

    _hospitalMarkers = hospitalMarkers;
    notifyListeners();
  }

  void refreshMap() {
    stopPositionStream();
    _userposition = null;
    _hospitalMarkers.clear();
    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      startPositionStream();
    });
    Future.delayed(const Duration(seconds: 2), () {
      addHospitalMarkers(mapsModel.hospitalCordinates);
    });
  }
}
