import 'dart:async';
import 'package:geolocator/geolocator.dart';

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
      throw Exception("User didi not grand GPS permissions.");
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
