import 'package:flutter/material.dart';
import 'package:flutter_application_1/Map.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  
  @override
  Widget build(BuildContext context) {

    final List<Map<String, double>> yourLocationList = [
  {"lat": 23.1765, "lng": 77.3156}, // Example: police station
  {"lat": 23.1791, "lng": 77.4398}, // Example: hospital
];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenRootMap(points:yourLocationList),
    );
  }
}
