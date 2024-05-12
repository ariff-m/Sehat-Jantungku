import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreventionPage extends StatelessWidget {
  const PreventionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Saran Penanganan',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
