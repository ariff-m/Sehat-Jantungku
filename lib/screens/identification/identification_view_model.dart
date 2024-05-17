import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sehatjantungku/model/identification_model.dart';
import 'package:sehatjantungku/service/identification_service.dart';
import 'package:sehatjantungku/service/predictions_service.dart';

class IdentificationViewModel extends ChangeNotifier {
  Data? _selectedIdentification;
  IdentificationModel? _identificationModel;

  Data? get selectedIdentification => _selectedIdentification;
  IdentificationModel? get identificationModel => _identificationModel;

  set identificationModel(IdentificationModel? model) {
    _identificationModel = model;
    if (kDebugMode) {
      print('Identification Model set: $_identificationModel');
    }
    notifyListeners();
  }

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

  Future<void> fetchIdentificationModel() async {
    try {
      identificationModel = await _service.fetchIdentificationModel();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch data: $e');
      }
    }
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
          print('Data successfully submitted!');
        }

        await fetchIdentificationModel();

        Data? identificationWithNullResult;
        for (var data in _identificationModel!.data) {
          if (data.result == null) {
            identificationWithNullResult = data;
            break;
          }
        }

        if (identificationWithNullResult != null) {
          final id = identificationWithNullResult.id;

          if (kDebugMode) {
            print('ID of data with null result: $id');
          }

          await PredictService().getPrediction(id);
        } else {
          if (kDebugMode) {
            print('No data found with null result.');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Failed to submit data: $e');
        }
      }
    }
  }
}
