import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sehatjantungku/utils/base_url.dart';
import 'package:sehatjantungku/model/identification_model.dart';

class IdentificationService {
  final Dio _dio = Dio();
  final String baseUrl = identification;

  Future<IdentificationModel> fetchIdentificationModel() async {
    try {
      final response = await _dio.get("$baseUrl/identification/");

      if (response.statusCode == 200) {
        return IdentificationModel.fromJson(response.data);
      } else {
        if (kDebugMode) {
          print('Gagal mengambil data: ${response.statusCode}');
        }
        throw Exception('Gagal mengambil data: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }

  Future<IdentificationModel> fetchIdentificationModelById(String id) async {
    try {
      final response = await _dio.get("$baseUrl/identification/$id");

      if (response.statusCode == 200) {
        return IdentificationModel.fromJson(response.data);
      } else {
        if (kDebugMode) {
          print('Gagal mengambil data: ${response.statusCode}');
        }
        throw Exception('Gagal mengambil data: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }

  Future<Response<dynamic>> submitIdentificationModel(Data data) async {
    try {
      final response = await _dio.post(
        "$baseUrl/identification/",
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
        data: json.encode(data.toJson()),
      );

      if (response.statusCode == 201) {
        if (kDebugMode) {
          print('Data berhasil dikirim!');
        }
      } else {
        if (kDebugMode) {
          print('Gagal mengirim data: ${response.statusCode}');
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
