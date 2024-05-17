import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/model/identification_model.dart';
import 'package:sehatjantungku/screens/identification/identification_screen.dart';
import 'package:sehatjantungku/screens/identification/identification_view_model.dart';
import 'package:sehatjantungku/widgets/bottom_navigator_widget.dart';

void main() {
  testWidgets('Identification Screen Test',
      (WidgetTester tester) async {
    final fakeIdentificationModel = IdentificationModel(
      message: 'Success',
      data: [
        Data(
          id: 1,
          userId: 1,
          name: 'Test User',
          date: DateTime.now(),
          time: '12:00',
          age: 30,
          sex: 1,
          chestPainType: 1,
          restingBp: 120,
          cholesterol: 200,
          fastingBs: 0,
          restingEcg: 1,
          maxHr: 150,
          exerciseAngina: 0,
          oldpeak: 1.0,
          stSlope: 2,
          result: 'Normal',
        ),
      ],
    );

    final viewModel = IdentificationViewModel();
    viewModel.identificationModel = fakeIdentificationModel;

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => viewModel,
        child: const MaterialApp(
          home: IdentificationScreen(),
        ),
      ),
    );

    expect(find.text('Identification'), findsNWidgets(2));

    expect(find.text('Test User'), findsOneWidget);

    expect(find.byType(FloatingActionButton), findsOneWidget);

    expect(find.byType(MyBottomNavigationBar), findsOneWidget);
  });
}
