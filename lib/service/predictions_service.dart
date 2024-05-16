import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sehatjantungku/utils/base_url.dart';

class PredictService {
  final Dio _dio = Dio();
  final String baseUrl = predict;

  Future<Response<dynamic>> getPrediction(int id) async {
    try {
      final response = await _dio.get(
        "$baseUrl/predict/1/$id",
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print('Prediksi berhasil dilakukan!');
        }
      } else {
        if (kDebugMode) {
          print('Gagal melakukan prediksi: ${response.statusCode}');
        }
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }
}
