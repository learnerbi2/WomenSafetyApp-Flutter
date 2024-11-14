import 'dart:math';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shesecure/qoting/Motivationaltext.dart';
import 'package:shesecure/video%20content/crousalpage.dart';
import 'package:shesecure/video%20content/slider.dart';
import 'package:shesecure/video%20content/videocrousal.dart';
//import 'package:womensafetyapp/sosFunction.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainUI());
  }
}

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
//quotes
  int qIndex = 0;

  getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(6);
    });
  }

//permission
  @override
  void initState() {
    super.initState();
        getRandomQuote();
    requestPermissions(); // Request permissions when the app starts
  }

  Future<void> requestPermissions() async {
    // Request microphone permission
    var microphoneStatus = await Permission.microphone.request();
    if (microphoneStatus.isGranted) {
      print("Microphone permission granted.");
    } else if (microphoneStatus.isDenied) {
      print("Microphone permission denied.");
      openAppSettings();
    }

    // Request location permission
    var locationStatus = await Permission.location.request();
    if (locationStatus.isGranted) {
      print("Location permission granted.");
    } else if (locationStatus.isDenied) {
      print("Location permission denied.");
      openAppSettings();
    }
  }

  List cateNames = [
    "SOS",
    "Gender Detection",
    "Location",
    "Hotspots",
  ];
  List<Color> cateColors = [
    const Color.fromARGB(255, 9, 101, 240),
    const Color.fromARGB(255, 16, 25, 202),
    const Color.fromARGB(255, 147, 69, 216),
    const Color.fromARGB(255, 75, 14, 241),
  ];

  List<Icon> catIcons = [
    const Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.person,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.location_on,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.dangerous,
      color: Colors.white,
      size: 30,
    ),
  ];

  void _categoryTapped(int index) {
    // Handle the category tap here
    if (index == 0) {
      // Trigger SOS action
    } else if (index == 1) {
      // Navigate to gender detection screen
      Navigator.pushNamed(context, '/genderDetection');
    } else if (index == 2) {
      // Navigate to location screen
      Navigator.pushNamed(context, '/location');
    } else if (index == 3) {
      // Navigate to hotspots screen
      Navigator.pushNamed(context, '/hotspots');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [videomethod(context)],
    ));
  }
  Container videomethod(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ListView(
        children: [
          //Appbar and search function
          header(),
          const SizedBox( height: 10),
          //slider for videos
         // CustomCarouel(),
          // SizedBox(height:10),
          slider(),
          SizedBox(height:10),
          //tips and tools
          Padding(
          padding: EdgeInsets.only(left:100),
          child: const Text(
              "Tips and Tools",
          style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
          padding: const EdgeInsets.only(left: 15, bottom: 20, right: 15),
          decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                            itemCount: cateNames.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.1,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: cateColors[index],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: catIcons[index],
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(cateNames[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.8),
                                      ))
                                ],
                              );
                            })
                      ],
                    ),
                  )))
        ],
      ),
    );
  }

  Container header() {
    return Container(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.more_vert,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),  
            Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 15),
                child: CustomAppBar(
                  onTap: getRandomQuote(),
                  quoteIndex: qIndex,
                )),
            Container(
              height: 55,
              margin: const EdgeInsets.only(top: 3, bottom: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Here...",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
                  contentPadding: const EdgeInsets.only(top: 13),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            )
          ],
        ));
  }
}
