import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/page/maps/maps_view_model.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<MapsProvider>(context, listen: false).startPositionStream();
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
        child: Consumer<MapsProvider>(
          builder: (context, mapsProvider, _) {
            LatLng myLocation = mapsProvider.userPosition != null
                ? LatLng(mapsProvider.userPosition!.latitude,
                    mapsProvider.userPosition!.longitude)
                : const LatLng(0, 0);
            return GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: myLocation, zoom: 14),
              markers: {
                Marker(
                    markerId: const MarkerId('myLocation'),
                    position: myLocation)
              },
              onMapCreated: (GoogleMapController controller) {
                mapsProvider.initializeMapController(controller);
              },
            );
          },
        ),
      ),
    );
  }
}
