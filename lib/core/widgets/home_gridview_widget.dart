import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';
import 'package:mobil_proje_piton/models/musics_list.dart';
import 'package:mobil_proje_piton/views/audioplay_screen.dart';

class GridViewHome extends StatelessWidget {
  final List<MusicsList> filteredMusics;

  const GridViewHome({Key? key, required this.filteredMusics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final crossAxisCount = (screenWidth / 200).floor();

    final screenPadding = 12.0;

    return GridView.builder(
      itemCount: filteredMusics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: screenPadding,
        mainAxisSpacing: screenPadding,
        childAspectRatio: 160 / 232,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AudioplayScreen(music: filteredMusics[index]),
              ),
            );
          },
          child: _buildPodcastCard(filteredMusics[index]),
        );
      },
    );
  }

  Widget _buildPodcastCard(MusicsList music) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 232,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.asset(
                music.musics_Imagepath,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    music.musics_Textfield,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 9),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    music.musics_Name,
                    style: const TextStyle(color: Colors.black87, fontSize: 7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
