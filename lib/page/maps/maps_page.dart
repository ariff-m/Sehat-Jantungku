import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/page/maps/maps_view_model.dart';
import 'package:sehatjantungku/model/maps_model.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<MapsProvider>(context, listen: false).addCustomIcon();
    Provider.of<MapsProvider>(context, listen: false).startPositionStream();
    Provider.of<MapsProvider>(context, listen: false).stopPositionStream();

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
        body: Stack(
          children: [
            Center(
              child: Consumer<MapsProvider>(
                builder: (context, mapsProvider, _) {
                  LatLng myLocation = mapsProvider.userPosition != null
                      ? LatLng(mapsProvider.userPosition!.latitude,
                          mapsProvider.userPosition!.longitude)
                      : const LatLng(0, 0);
                  return GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: myLocation, zoom: 11.5),
                    markers: {
                      ...mapsProvider.hospitalMarkers.toSet(),
                      Marker(
                        markerId: const MarkerId('myLocation'),
                        position: myLocation,
                        icon: mapsProvider.markerIcon ??
                            BitmapDescriptor.defaultMarker,
                      )
                    },
                    onMapCreated: (GoogleMapController controller) {
                      mapsProvider.initializeMapController(controller);
                      //mapsProvider.addHospitalMarkers(hospitalCordinates);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Provider.of<MapsProvider>(context, listen: false)
                        .addHospitalMarkers(hospitalCordinates);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: Text(
                    'Cari Rumah Sakit',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
