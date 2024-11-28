import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';
import 'package:mobil_proje_piton/core/widgets/podkes_carousel_widget.dart';
import 'package:mobil_proje_piton/core/widgets/podkes_indicator_widget.dart';
import 'package:mobil_proje_piton/core/widgets/podkes_button_widget.dart';
import 'package:mobil_proje_piton/models/slidepodkes_list.dart';

class PodkesScreen extends StatefulWidget {
  const PodkesScreen({super.key});

  @override
  _PodkesScreenState createState() => _PodkesScreenState();
}

class _PodkesScreenState extends State<PodkesScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onNextButtonPressed() {
    if (_currentPage < podkes.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final double beforeCarouselSpace = 98 * (screenHeight / 812);
    final double afterCarouselSpace = 44 * (screenHeight / 812);
    final double beforeIndicatorSpace = 102 * (screenHeight / 812);
    final double beforeButtonSpace = 37 * (screenHeight / 812);

    return Scaffold(
      backgroundColor: ColorPalette.pagesBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: beforeCarouselSpace),
          // Carousel
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: PodkesCarouselWidget(
                onPageChanged: _onPageChanged,
                pageController: _pageController,
              ),
            ),
          ),
          SizedBox(height: afterCarouselSpace),
          // Indicator
          PodkesIndicatorWidget(
            currentPage: _currentPage,
            totalDots: podkes.length,
          ),
          SizedBox(height: beforeIndicatorSpace),
          // Button
          PodkesButtonWidget(
            onTap: _onNextButtonPressed,
          ),
          SizedBox(height: beforeButtonSpace),
        ],
      ),
    );
  }
}
