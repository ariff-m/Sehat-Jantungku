import 'package:flutter/material.dart';
import 'package:sehatjantungku/constants/color_constant.dart';

class BoxConstant {
  static List<BoxShadow> shadow1 = [
    BoxShadow(
      color: ColorConstant.grey1.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 7,
      offset: const Offset(0, 3),
    )
  ];

  static BoxDecoration decoration1 = BoxDecoration(
    color: ColorConstant.secondary,
    borderRadius: BorderRadius.circular(30),
    boxShadow: shadow1,
  );

  static BoxDecoration decoration2 = BoxDecoration(
    color: ColorConstant.primary,
    borderRadius: BorderRadius.circular(20),
    boxShadow: shadow1,
  );

  static BoxDecoration decoration3 = BoxDecoration(
    color: ColorConstant.primary,
    borderRadius: BorderRadius.circular(20),
    boxShadow: shadow1,
    border: Border.all(
      color: ColorConstant.grey1,
      width: 0.5,
    ),
  );

  static BoxDecoration decoration3WithThinBorder = BoxDecoration(
    color: ColorConstant.primary,
    borderRadius: BorderRadius.circular(20),
    boxShadow: shadow1,
    border: Border.all(
      color: ColorConstant.grey2,
      width: 0.1,
    ),
  );
}
