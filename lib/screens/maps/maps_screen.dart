import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/screens/maps/maps_view_model.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/widgets/bottom_navigator_widget.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<MapsViewModel>(context, listen: false).addCustomIcon();
    Provider.of<MapsViewModel>(context, listen: false).startPositionStream();
    Provider.of<MapsViewModel>(context, listen: false).stopPositionStream();

    final MapsViewModel mapsProvider =
        Provider.of<MapsViewModel>(context, listen: false);
    int currentIndex = 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Lokasi Pusat Kesehatan',
            style: TextStyleConstant.fontStyleHeader1),
      ),
      body: Stack(
        children: [
          Center(
            child: Consumer<MapsViewModel>(
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
                  Provider.of<MapsViewModel>(context, listen: false)
                      .addHospitalMarkers(
                          mapsProvider.mapsModel.hospitalCordinates);
                },
                style: TextButton.styleFrom(
                  backgroundColor: ColorConstant.secondary,
                  padding: const EdgeInsets.all(16.0),
                ),
                child: Text(
                  'Cari Rumah Sakit',
                  style: TextStyleConstant.buttonMaps,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homePage');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/IdentificationScreen');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/MapsScreen');
          }
        },
      ),
    );
  }
}
