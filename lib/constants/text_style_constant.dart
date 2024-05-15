import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehatjantungku/constants/color_constant.dart';

class TextStyleConstant {
  static TextStyle appbar = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: ColorConstant.primary,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle fontStyleHeader1 = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: ColorConstant.primary,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle fontStyleHeader2 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle fontStyleHeader3 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
  );

   static TextStyle fontStyleHeader4 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );

   static TextStyle fontStyle1 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontWeight: FontWeight.normal,
    ),
  );

  static TextStyle buttonCek = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: ColorConstant.secondary,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextStyle buttonMaps = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: ColorConstant.primary,
      fontWeight: FontWeight.w500,
    ),
  );
}
