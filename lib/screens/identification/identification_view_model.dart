import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sehatjantungku/model/identification_model.dart';
import 'package:sehatjantungku/service/identification_service.dart';
import 'package:sehatjantungku/service/predictions_service.dart';

class IdentificationViewModel extends ChangeNotifier {
  Data? _selectedIdentification;

  Data? get selectedIdentification => _selectedIdentification;

  set selectIdentification(Data identification) {
    _selectedIdentification = identification;
    if (kDebugMode) {
      print('Selected Identification: $_selectedIdentification');
    }
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();
  final IdentificationService _service = IdentificationService();
  String name = '';
  DateTime date = DateTime.now();
  String time = DateFormat('HH:mm').format(DateTime.now());
  int age = 0;
  int sex = 0;
  int chestPainType = 0;
  int restingBp = 0;
  int cholesterol = 0;
  int fastingBs = 0;
  int restingEcg = 0;
  int maxHr = 0;
  int exerciseAngina = 0;
  double oldpeak = 0.0;
  int stSlope = 0;

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> submitForm() async {
    if (validateForm()) {
      formKey.currentState?.save();
      Data model = Data(
        id: 0,
        userId: 1,
        name: name,
        date: date,
        time: time,
        age: age,
        sex: sex,
        chestPainType: chestPainType,
        restingBp: restingBp,
        cholesterol: cholesterol,
        fastingBs: fastingBs,
        restingEcg: restingEcg,
        maxHr: maxHr,
        exerciseAngina: exerciseAngina,
        oldpeak: oldpeak,
        stSlope: stSlope,
      );

      try {
        await _service.submitIdentificationModel(model);
        if (kDebugMode) {
          print('Data berhasil dikirim!');
        }

        final allIdentifications = await _service.fetchIdentificationModel();

        Data? identificationWithNullResult;
        for (var data in allIdentifications.data) {
          if (data.result == null) {
            identificationWithNullResult = data;
            break;
          }
        }

        if (identificationWithNullResult != null) {
          final id = identificationWithNullResult.id;

          if (kDebugMode) {
            print('ID dari data dengan result null: $id');
          }

          PredictService().getPrediction(id);
        } else {
          if (kDebugMode) {
            print('Tidak ditemukan data dengan result null.');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Gagal mengirim data: $e');
        }
      }
    }
  }
}
