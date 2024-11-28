import 'package:flutter/material.dart';
import '../../core/constants/color_Palette.dart';

class PodkesIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalDots;

  const PodkesIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.totalDots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? ColorPalette.sliderDotSelected
                : ColorPalette.sliderDot,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
