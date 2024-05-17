import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/screens/maps/maps_screen.dart';
import 'package:sehatjantungku/screens/maps/maps_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  testWidgets('Maps Screen Test', (WidgetTester tester) async {
    final mapsViewModel = MapsViewModel();

    await tester.pumpWidget(
      ChangeNotifierProvider<MapsViewModel>.value(
        value: mapsViewModel,
        child: const MaterialApp(
          home: MapsScreen(),
        ),
      ),
    );

    expect(find.text('Lokasi Pusat Kesehatan'), findsOneWidget);
    expect(find.byType(GoogleMap), findsOneWidget);
    expect(find.text('Cari Rumah Sakit'), findsOneWidget);

    await tester.tap(find.text('Cari Rumah Sakit'));
    await tester.pump();

    expect(mapsViewModel.hospitalMarkers.isNotEmpty, true);
  });
}
