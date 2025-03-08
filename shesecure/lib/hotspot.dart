

import 'package:flutter/material.dart';
import 'package:shesecure/Login.dart';

class hotspot extends StatefulWidget {
  const hotspot({super.key});

  @override
  State<hotspot> createState() => _hotspotState();
}

class _hotspotState extends State<hotspot> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()))
        //  Text(
        //   "hotspot",
        // style: TextStyle(color:Colors.cyan),
        //   ),
        //
        );
  }
}
