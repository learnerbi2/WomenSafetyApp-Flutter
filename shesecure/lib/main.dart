
import "package:flutter/material.dart";
import "package:shesecure/SplashScreen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    theme: ThemeData(brightness: Brightness.light,primarySwatch: Colors.deepPurple);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: SplashScreen(),
    );
  }
}