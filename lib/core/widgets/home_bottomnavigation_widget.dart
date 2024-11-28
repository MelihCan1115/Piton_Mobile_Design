import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorPalette.menuBackground,
      selectedItemColor: ColorPalette.menuButtonWhite,
      unselectedItemColor: ColorPalette.menuButtonGray,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/icon_Discover.png',
            width: 24,
            height: 24,
          ),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/icon_Library.png',
            width: 24,
            height: 24,
          ),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/icon_Profile.png',
            width: 24,
            height: 24,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
