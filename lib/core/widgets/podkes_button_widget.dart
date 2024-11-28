import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';

class PodkesButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const PodkesButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: ColorPalette.textColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_forward,
              size: 32.0,
              color: ColorPalette.sliderDotSelected,
            ),
          ),
        ),
      ),
    );
  }
}
