import 'package:flutter/material.dart';
import 'package:shesecure/bottomnavigation/contacts.dart';
import 'package:shesecure/homepage.dart';

class bottom_page extends StatefulWidget {
  const bottom_page({super.key});

  @override
  State<bottom_page> createState() => _bottom_pageState();
}

class _bottom_pageState extends State<bottom_page> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Contacts(),
      MainApp(),
      
    ];
    return const Placeholder();
  }
}
