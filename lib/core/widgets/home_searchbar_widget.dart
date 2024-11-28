import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';

class homeSearchBar extends StatelessWidget {
  final Function(String)? onSearch;

  const homeSearchBar({Key? key, this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      child: TextField(
        onChanged: (query) {
          if (onSearch != null) {
            onSearch!(query);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorPalette.menuBackground,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            color: ColorPalette.textColor, // Hint metninin rengi
            fontSize: 13,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/icons/icon_Search.png',
              width: 20,
              height: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
          color: ColorPalette.textColor, // Yazı rengini kırmızı yapıyoruz
          fontFamily: 'Inter', // Yazı fontu
          fontSize: 16, // Yazı boyutu
        ),
      ),
    );
  }
}
