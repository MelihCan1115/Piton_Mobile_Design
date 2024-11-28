import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';

class homeNavigation extends StatelessWidget {
  const homeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: ColorPalette
              .menuBackground, // Drawer'ın arkaplan rengini belirliyoruz
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context),
              ],
            ),
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: ColorPalette
            .pagesBackground, // Header'ın arkaplan rengini belirliyoruz
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage('assets/images/img_Podkes.png'),
            ),
            SizedBox(height: 12),
            Text(
              'Sarah Abs',
              style: TextStyle(
                fontSize: 28,
                color: ColorPalette.textColor,
              ),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 4,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: ColorPalette.menuButtonWhite,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: ColorPalette.textColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.man_2_outlined,
                color: ColorPalette.menuButtonWhite,
              ),
              title: const Text(
                'My Profile',
                style: TextStyle(
                  color: ColorPalette.textColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_border,
                color: ColorPalette.menuButtonWhite,
              ),
              title: const Text(
                'Favourites',
                style: TextStyle(
                  color: ColorPalette.textColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
}
