import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sehatjantungku/page/maps/maps_view_model.dart';
import 'package:geolocator/geolocator.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final GPS _gps = GPS();
  Position? _userposition;

  void _handelPositionStream(Position position) {
    setState(() {
      _userposition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    LatLng myLocation = _userposition != null
        ? LatLng(_userposition!.latitude, _userposition!.longitude)
        : const LatLng(0, 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Lokasi Pusat Kesehatan',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: myLocation, zoom: 14),
          markers: {
            Marker(markerId: const MarkerId('myLocation'), position: myLocation)
          },
          onMapCreated: (GoogleMapController controller) {
            if (_userposition != null) {
              controller.animateCamera(
                CameraUpdate.newLatLngZoom(
                  LatLng(_userposition!.latitude, _userposition!.longitude),
                  14,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _gps.startPositionStream(_handelPositionStream).catchError((e) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _gps.stopPositionStream();
  }
}
