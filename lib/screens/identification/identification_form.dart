import 'package:flutter/material.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';

class IdentificationFormScreen extends StatelessWidget {
  const IdentificationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.primary),
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
        title: Text(
          'Identification Form',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
    );
  }
}
