//import 'package:mobil_proje_piton/views/screen_Play.dart';

import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/views/home_screen.dart';
import 'package:mobil_proje_piton/views/podkes_screen.dart';

var pitonRoutes = <String, WidgetBuilder>{
  '/home': (context) => HomeScreen(),
  '/podkes': (context) => PodkesScreen(),
};
