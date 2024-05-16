import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/image_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';

import 'package:sehatjantungku/screens/identification/identification_view_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorConstant.primary),
        title: Text(
          'Identification Detail',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<IdentificationViewModel>(
          builder: (context, identificationViewModel, child) {
            final selectedIdentification =
                identificationViewModel.selectedIdentification;

            if (selectedIdentification == null) {
              return const Center(
                child: Text('No identification selected'),
              );
            }
            final timeParts = selectedIdentification.time.split(':');
            final formattedTime = '${timeParts[0]}:${timeParts[1]}';

            Widget resultImage;

            if (selectedIdentification.result == 'Pemeriksaan Lanjutan') {
              resultImage = Image.asset(
                ImageConstant.positif,
                width: 100,
                height: 100,
              );
            } else if (selectedIdentification.result == 'Jantungmu Sehat') {
              resultImage = Image.asset(
                ImageConstant.negatif,
                width: 100,
                height: 100,
              );
            } else {
              resultImage = const SizedBox();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                resultImage,
                Text('${selectedIdentification.result}'),
                Center(
                  child: Container(
                    height: 350,
                    width: 300,
                    decoration: BoxConstant.decoration3WithThinBorder,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nama: ${selectedIdentification.name}'),
                        Text(
                          'Tanggal: ${DateFormat('dd-MM-yyyy').format(selectedIdentification.date)}',
                        ),
                        Text('Waktu: $formattedTime'),
                        Text('Jenis Kelamin: ${selectedIdentification.sex}'),
                        Text('Umur: ${selectedIdentification.age}'),
                        Text(
                            'Jenis Nyeri Data: ${selectedIdentification.chestPainType}'),
                        Text(
                            'Tekanan Darah Saat Istirahat: ${selectedIdentification.restingBp}'),
                        Text(
                            'Kolestrol: ${selectedIdentification.cholesterol}'),
                        Text(
                            'Gula Darah saat Puasa: ${selectedIdentification.fastingBs}'),
                        Text(
                            'Elektrokardiogram saat Istirahat: ${selectedIdentification.restingEcg}'),
                        Text(
                            'Latihan Angina: ${selectedIdentification.exerciseAngina}'),
                        Text('Old Peak: ${selectedIdentification.oldpeak}'),
                        Text(
                            'Kemiringan ST: ${selectedIdentification.stSlope}'),
                        Text(
                            'Detak Jantung Maksimal: ${selectedIdentification.maxHr}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (selectedIdentification.result ==
                        'Pemeriksaan Lanjutan') {
                      Navigator.pushNamed(context, '/treatmentPage');
                    } else if (selectedIdentification.result ==
                        'Jantungmu Sehat') {
                      Navigator.pushNamed(context, '/preventionPage');
                    }
                  },
                  child: Text(
                    selectedIdentification.result == 'Pemeriksaan Lanjutan'
                        ? 'Saran Penanganan'
                        : 'Saran Pencegahan',
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mapsPage');
                  },
                  child: const Text('Pusat Kesehatan Terdekat'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
