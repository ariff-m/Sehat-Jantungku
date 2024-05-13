import 'package:flutter/material.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';

class PreventionPage extends StatelessWidget {
  const PreventionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Saran Pencegahan',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 500,
              width: double.infinity,
              decoration: BoxConstant.decoration3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Berikut ini merupakan saran pencegahan penyakit jantung atau kardiovaskular: ",
                    style: TextStyleConstant.fontStyleHeader3,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    " ",
                    style: TextStyleConstant.fontStyle1,
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
