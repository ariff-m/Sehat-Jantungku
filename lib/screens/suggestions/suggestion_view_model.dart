import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class PreventionViewModel extends ChangeNotifier {
  final Gemini _gemini = Gemini.instance;
  final String _systemInstructions =
      'Kamu merupakan assisten dokter, sekarang tolong berikan saran pencegahan penyakit jantung atau penyakit kardiovaskular (tolong kata-katanya jangan terlalu kaku usahakan semua kalangan paham)';

  String _response = '';
  bool _isLoading = false;

  String get response => _response;
  bool get isLoading => _isLoading;

  void getResponseGemini() async {
    _isLoading = true;
    _response = '';

    try {
      StringBuffer buffer = StringBuffer();
      _gemini.streamGenerateContent(_systemInstructions).listen(
        (event) {
          buffer.write(event.content?.parts?.fold(
                  "",
                  (previousValue, element) =>
                      "$previousValue${element.text}") ??
              "");
        },
        onDone: () {
          _response = buffer.toString();
          _isLoading = false;
          notifyListeners();
        },
        onError: (error) {
          _isLoading = false;
          notifyListeners();
          throw Exception('Error fetching response: $error');
        },
      );
    } catch (err) {
      _isLoading = false;
      notifyListeners();
      throw Exception(err);
    }
  }
}

class TreatmentViewModel extends ChangeNotifier {
  final Gemini _gemini = Gemini.instance;
  final String _systemInstructions =
      'Kamu merupakan assisten dokter, sekarang tolong berikan saran perubahan gaya hidup untuk pasien yang terdeteksi gejala penyakit jantung atau penyakit kardiovaskular (tolong kata-katanya jangan terlalu kaku usahakan semua kalangan paham)';

  String _response = '';
  bool _isLoading = false;

  String get response => _response;
  bool get isLoading => _isLoading;

  void getResponseGemini() async {
    _isLoading = true;
    _response = '';

    try {
      StringBuffer buffer = StringBuffer();
      _gemini.streamGenerateContent(_systemInstructions).listen(
        (event) {
          buffer.write(event.content?.parts?.fold(
                  "",
                  (previousValue, element) =>
                      "$previousValue${element.text}") ??
              "");
        },
        onDone: () {
          _response = buffer.toString();
          _isLoading = false;
          notifyListeners();
        },
        onError: (error) {
          _isLoading = false;
          notifyListeners();
          throw Exception('Error fetching response: $error');
        },
      );
    } catch (err) {
      _isLoading = false;
      notifyListeners();
      throw Exception(err);
    }
  }
}
