import 'package:flutter/material.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/image_constant.dart';
import 'package:sehatjantungku/screens/home/home_view_model.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:sehatjantungku/screens/identification/identification_screen.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 280,
              width: double.infinity,
              decoration: BoxConstant.decoration1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        ImageConstant.doctor,
                        height: 140,
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Text(
                          'Suarakan Kesehatan Jantungmu dengan Aplikasi Deteksi Dini Penyakit Jantung',
                          style: TextStyleConstant.fontStyleHeader1,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxConstant.decoration1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayo Tes',
                          style: TextStyleConstant.fontStyleHeader1,
                        ),
                        Text(
                          'Kardiovaskular',
                          style: TextStyleConstant.fontStyleHeader1,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/identificationPage');
                          },
                          style: ElevatedButton.styleFrom(),
                          child: Text('Cek Sekarang',
                              style: TextStyleConstant.buttonCek),
                        ),
                      ],
                    ),
                    Image.asset(
                      ImageConstant.doctorAndpatient,
                      height: 110,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gejala Penyakit Jantung',
                    style: TextStyleConstant.fontStyleHeader2,
                  ),
                  SizedBox(
                    height: 180,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxConstant.decoration2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: Image.asset(
                                      viewModel.homePageModel.images[index],
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical:
                                          (index >= 2 && index <= 6) ? 11 : 0,
                                    ),
                                    child: Text(
                                      viewModel.homePageModel.textGejala[index],
                                      style: TextStyleConstant.fontStyleHeader3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Video Edukasi',
                    style: TextStyleConstant.fontStyleHeader2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 210,
                    decoration: BoxConstant.decoration1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: YoutubePlayer(
                        controller: viewModel.ytControl,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 210,
                    decoration: BoxConstant.decoration1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: YoutubePlayer(
                        controller: viewModel.ytControl2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
