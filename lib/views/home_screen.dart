import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';
import 'package:mobil_proje_piton/core/widgets/home_drawer_widget.dart';
import 'package:mobil_proje_piton/core/widgets/home_bottomnavigation_widget.dart';
import 'package:mobil_proje_piton/core/widgets/home_notification_widget.dart';
import 'package:mobil_proje_piton/core/widgets/home_searchbar_widget.dart';
import 'package:mobil_proje_piton/core/widgets/home_gridview_widget.dart';
import 'package:mobil_proje_piton/models/musics_list.dart';
import 'package:mobil_proje_piton/core/widgets/home_categorychip_widget.dart'; // Yeni dosyayı içe aktarın

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;
  String _selectedCategory = 'All';
  List<MusicsList> _filteredMusics = musics;

  void _filterByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredMusics = musics;
      } else {
        _filteredMusics =
            musics.where((music) => music.musics_Category == category).toList();
      }
    });
  }

  void _onSearch(String query) {
    setState(() {
      _filteredMusics = musics
          .where((music) =>
              music.musics_Name.toLowerCase().contains(query.toLowerCase()) ||
              music.musics_Textfield
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              music.musics_Category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.pagesBackground,
      appBar: AppBar(
        backgroundColor: ColorPalette.pagesBackground,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Podkes",
          style: TextStyle(
              fontFamily: 'Poppins',
              color: ColorPalette.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/icons/icon_Drawer.png',
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              ShowAlertDialog.show(context);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/icons/icon_Notification.png',
                width: 21,
                height: 21,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      drawer: const homeNavigation(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeSearchBar(onSearch: _onSearch),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(
                    category: 'All',
                    isSelected: _selectedCategory == 'All',
                    onTap: () => _filterByCategory('All'),
                  ),
                  CategoryChip(
                    category: 'Life',
                    isSelected: _selectedCategory == 'Life',
                    onTap: () => _filterByCategory('Life'),
                  ),
                  CategoryChip(
                    category: 'Comedy',
                    isSelected: _selectedCategory == 'Comedy',
                    onTap: () => _filterByCategory('Comedy'),
                  ),
                  CategoryChip(
                    category: 'Tech',
                    isSelected: _selectedCategory == 'Tech',
                    onTap: () => _filterByCategory('Tech'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Trending",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridViewHome(filteredMusics: _filteredMusics),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
      ),
    );
  }
}
