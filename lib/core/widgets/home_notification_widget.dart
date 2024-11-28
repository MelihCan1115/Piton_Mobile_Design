import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';

class ShowAlertDialog {
  // AlertDialog'u gösteren bir fonksiyon
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorPalette.menuBackground, // Mavi arka plan
          title: Text(
            'Notification',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: ColorPalette.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ), // İçerik rengi beyaz
          content: Text(
            'Don\'t have any notifications.',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: ColorPalette.textColor,
              fontSize: 13,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white), // Buton rengi beyaz
              ),
            ),
          ],
        );
      },
    );
  }
}
