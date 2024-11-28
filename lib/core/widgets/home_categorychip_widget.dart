import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorPalette.sliderDotSelected
              : ColorPalette.groupBackground,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Yatay boşluk
          child: Text(
            category,
            style: const TextStyle(
              color: ColorPalette.categoriesText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
