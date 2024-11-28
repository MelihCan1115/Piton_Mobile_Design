import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/models/slidepodkes_list.dart';
import '../../core/constants/color_Palette.dart';

class PodkesCarouselWidget extends StatefulWidget {
  final Function(int) onPageChanged;
  final PageController pageController;

  const PodkesCarouselWidget({
    Key? key,
    required this.onPageChanged,
    required this.pageController,
  }) : super(key: key);

  @override
  _PodkesCarouselWidgetState createState() => _PodkesCarouselWidgetState();
}

class _PodkesCarouselWidgetState extends State<PodkesCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      onPageChanged: (index) {
        widget.onPageChanged(index);
      },
      itemCount: podkes.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(72),
                topRight: Radius.circular(72),
              ),
              child: Image.asset(
                podkes[index].podkes_Imagepath,
                fit: BoxFit.cover,
                width: 240,
                height: 317,
              ),
            ),
            const SizedBox(height: 42.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                podkes[index].podkes_Name,
                style: TextStyle(
                  fontSize: 36.0,
                  fontFamily: 'Poppins',
                  color: ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              podkes[index].podkes_Textfield,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'Inter',
                color: ColorPalette.textColorHint,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
