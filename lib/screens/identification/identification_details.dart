import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/image_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/screens/identification/identification_view_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
      body: Consumer<IdentificationViewModel>(
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
            children: [
              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.secondary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: BoxConstant.shadow1,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstant.primary,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: resultImage,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '${selectedIdentification.result}',
                        style:
                            selectedIdentification.result == 'Jantungmu Sehat'
                                ? TextStyleConstant.fontStyleHeader5
                                    .copyWith(color: ColorConstant.secondary)
                                : TextStyleConstant.fontStyleHeader5,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 350,
                  width: 330,
                  decoration: BoxConstant.decoration3WithThinBorder,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Detail:',
                            style: TextStyleConstant.fontStyleHeader3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text('Nama: ${selectedIdentification.name}',
                            style: TextStyleConstant.fontStyle1),
                        Text(
                            'Tanggal: ${DateFormat('dd-MM-yyyy').format(selectedIdentification.date)}',
                            style: TextStyleConstant.fontStyle1),
                        Text('Waktu: $formattedTime',
                            style: TextStyleConstant.fontStyle1),
                        Text('Jenis Kelamin: ${selectedIdentification.sex}',
                            style: TextStyleConstant.fontStyle1),
                        Text('Umur: ${selectedIdentification.age}',
                            style: TextStyleConstant.fontStyle1),
                        Text(
                            'Jenis Nyeri Data: ${selectedIdentification.chestPainType}',
                            style: TextStyleConstant.fontStyle1),
                        Text(
                            'Tekanan Darah Saat Istirahat: ${selectedIdentification.restingBp}',
                            style: TextStyleConstant.fontStyle1),
                        Text('Kolestrol: ${selectedIdentification.cholesterol}',
                            style: TextStyleConstant.fontStyle1),
                        Text(
                            'Gula Darah saat Puasa: ${selectedIdentification.fastingBs}',
                            style: TextStyleConstant.fontStyle1),
                        Text(
                            'Elektrokardiogram saat Istirahat: ${selectedIdentification.restingEcg}',
                            style: TextStyleConstant.fontStyle1),
                        Text(
                            'Latihan Angina: ${selectedIdentification.exerciseAngina}',
                            style: TextStyleConstant.fontStyle1),
                        Text('Old Peak: ${selectedIdentification.oldpeak}',
                            style: TextStyleConstant.fontStyle1),
                        Text('Kemiringan ST: ${selectedIdentification.stSlope}',
                            style: TextStyleConstant.fontStyle1),
                        Text(
                            'Detak Jantung Maksimal: ${selectedIdentification.maxHr}',
                            style: TextStyleConstant.fontStyle1),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorConstant.secondary,
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: () {
                  if (selectedIdentification.result == 'Pemeriksaan Lanjutan') {
                    Navigator.pushNamed(context, '/treatmentScreen');
                  } else if (selectedIdentification.result ==
                      'Jantungmu Sehat') {
                    Navigator.pushNamed(context, '/preventionScreen');
                  }
                },
                child: Text(
                  selectedIdentification.result == 'Pemeriksaan Lanjutan'
                      ? 'Saran Penanganan'
                      : 'Saran Pencegahan',
                  style: TextStyleConstant.buttonMaps,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorConstant.secondary,
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/mapsScreen');
                },
                child: Text(
                  'Pusat Kesehatan Terdekat',
                  style: TextStyleConstant.buttonMaps,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
