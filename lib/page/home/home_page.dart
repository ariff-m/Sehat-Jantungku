import 'package:flutter/material.dart';
import 'package:sehatjantungku/model/home_page_model.dart';
import 'package:sehatjantungku/page/home/home_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/login image.png',
                        height: 140,
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Text(
                          'Suarakan Kesehatan Jantungmu dengan Aplikasi Deteksi Dini Penyakit Jantung',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayo Tes',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Kardiovaskular',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(),
                          child: Text(
                            'Cek Sekarang',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.blue,
                                // fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/doctor.png',
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
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: Image.asset(
                                      images[index],
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
                                      textGejala[index],
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
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
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
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
