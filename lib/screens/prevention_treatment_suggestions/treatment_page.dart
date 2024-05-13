import 'package:flutter/material.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';

class TreatmentPage extends StatelessWidget {
  const TreatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Saran Penanganan',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 230,
              width: double.infinity,
              decoration: BoxConstant.decoration3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Segera konsultasikan diri Anda dengan dokter atau spesialis kardiovaskular: ",
                    style: TextStyleConstant.fontStyleHeader3,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Dokter akan melakukan pemeriksaan fisik yang komprehensif, mengevaluasi riwayat kesehatan dengan teliti, dan mungkin melakukan berbagai jenis tes diagnostik seperti elektrokardiogram (EKG), analisis darah secara menyeluruh, atau pencitraan jantung untuk mengetahui kondisi Anda.",
                    style: TextStyleConstant.fontStyle1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              height: 350,
              width: double.infinity,
              decoration: BoxConstant.decoration3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tips untuk Perubahan Gaya Hidup: ",
                      style: TextStyleConstant.fontStyleHeader3),
                  const SizedBox(height: 15),
                  Text(" ", style: TextStyleConstant.fontStyle1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
