import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/screens/home/home_page.dart';
import 'package:sehatjantungku/screens/identification/identification_page.dart';
import 'package:sehatjantungku/screens/maps/maps_page.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      MyHomePage(),
      const IdentificationPage(),
      const MapsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: ColorConstant.secondary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: ColorConstant.grey2,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart_circle),
        title: ("Identification"),
        activeColorPrimary: ColorConstant.secondary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: ColorConstant.grey2,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.map_fill),
        title: ("Maps"),
        activeColorPrimary: ColorConstant.secondary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: ColorConstant.grey2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        //borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.red,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}
