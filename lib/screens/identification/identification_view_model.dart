import 'package:flutter/foundation.dart';
import 'package:sehatjantungku/model/identification_model.dart';

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
}
