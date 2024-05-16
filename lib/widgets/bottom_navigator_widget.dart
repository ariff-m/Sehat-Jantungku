import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorConstant.primary,
      boxShadow: BoxConstant.shadow1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: GNav(
          rippleColor: ColorConstant.grey2,
          hoverColor: ColorConstant.grey1,
          gap: 8,
          activeColor: ColorConstant.primary,
          iconSize: 20,
          color: ColorConstant.grey2,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: ColorConstant.secondary,
          tabs: [
            GButton(
              icon: CupertinoIcons.home,
              text: 'Home',
              textStyle: TextStyleConstant.buttonMaps,
            ),
            GButton(
              icon: CupertinoIcons.heart_circle,
              text: 'Identification',
              textStyle: TextStyleConstant.buttonMaps,
            ),
            GButton(
              icon: CupertinoIcons.map_fill,
              text: 'Maps',
              textStyle: TextStyleConstant.buttonMaps,
            ),
          ],
          selectedIndex: currentIndex,
          onTabChange: onTap,
        ),
      ),
    );
  }
}
