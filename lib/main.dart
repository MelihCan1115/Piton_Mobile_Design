import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/routes/piton_routes.dart';

void main() async {
  runApp(PitonApp());
}

class PitonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/podkes',
      routes: pitonRoutes,
    );
  }
}
