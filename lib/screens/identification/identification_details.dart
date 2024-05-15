import 'package:flutter/material.dart';
import 'package:sehatjantungku/constants/color_constant.dart';

import 'package:sehatjantungku/constants/text_style_constant.dart';

class DetailPage extends StatelessWidget {
   final String id;
  const DetailPage({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
        title: Text(
          'Identification Detail',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
