
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shesecure/AboutUs.dart';
import 'package:shesecure/ContactScreen.dart';
import 'package:shesecure/Feedback.dart';
import 'package:shesecure/bottomnavigation/profile.dart';
import 'package:shesecure/qoting/Motivationaltext.dart';
import 'package:shesecure/video%20content/slider.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static Future<void> openMap(String location) async {
    
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MainUI());
  }
}

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    MainUI(),
    AboutUsScreen(),
    FeedbackScreen(),
    ContactScreen(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
     getRandomQuote();
     requestPermissions(); // Request permissions when the app starts
    super.initState();
   
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
    "Hotspots",
    "Emergency Contacts",
  ];
  List<Color> cateColors = [
    const Color.fromARGB(255, 9, 101, 240),
    const Color.fromARGB(255, 16, 25, 202),
    const Color.fromARGB(255, 147, 69, 216),
    const Color.fromARGB(255, 75, 14, 241),
  ];

  List<Image> catImages = [
    Image.asset('lib/assets/sos.png'),
    Image.asset('lib/assets/gender.png'),
    Image.asset('lib/assets/location.png'),
    Image.asset('lib/assets/contacts.png'),
  ];

//function call
 Future<void> _categoryTapped(int index, String categoryName) async {
    print("Tapped on $categoryName at index $index");
    // Here, you can add navigation or any other logic based on index or categoryName
    if (index == 0) {
      // For example, navigate to a specific screen
      print("Navigating to SOS screen...");
    } else if (index == 1) {
      // Navigate to gender detection screen
      print("Navigating to Gender Detection screen...");
    } else if (index == 2) {
      // Navigate to hotspots screen
      print("Navigating to Hotspots screen...");
          String googleUrl = 'https://www.google.com/maps/search/police+station+near+me/@23.1666823,77.2573852,12z/data=!3m1!4b1?entry=ttu&g_ep=EgoyMDI0MTExOS4yIKXMDSoASAFQAw%3D%3D';
    // if (Platform.isAndroid) {
    //   if (await canLaunchUrl(Uri.parse(googleUrl))) {
    //     await launchUrl(Uri.parse(googleUrl));
    //   } else {
    //     throw 'Could not launch $googleUrl';
    //   }
    // }
    } else if (index == 3) {
      // Navigate to emergency contacts screen
      print("Navigating to Emergency Contacts screen...");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("She Secure",style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        ),
        ),backgroundColor: Colors.blue,
        ),
          body: 
          Stack(
      children: [videomethod(context)],
        ),
      );
  }

  Container videomethod(BuildContext context) {
    return Container(
      //gradient
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [
      //     Color(0xFF0288D1),
      //     Color(0xFF0277BD),
      //     Color(0xFF01579B),
      //   ]

      //   )
      // ),

      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ListView(
        children: [
          //Appbar and search function
          header(),
          const SizedBox(height: 10),
          //slider for videos
          // CustomCarouel(),
          // SizedBox(height:10),
          slider(),
          SizedBox(height: 10),
          //tips and tools
          Padding(
            padding: EdgeInsets.only(left: 100),
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
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0288D1),
                    Color(0xFF01579B),
                    Color(0xFF4FC3F7),
                  ],
                ),
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
                                GestureDetector(
                                    onTap: () => _categoryTapped(index, cateNames[index]),
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          // decoration: BoxDecoration(
                                          // ),
                                          child: Center(
                                            child: catImages[index],
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(cateNames[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
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
            gradient: LinearGradient(
              colors: [
                Color(0xFF4FC3F7),
                Color(0xFF0288D1),
                Color(0xFF01579B),
              ],
            ),
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
                  Icons.menu,
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
            // Container(
            //   height: 55,
            //   margin: const EdgeInsets.only(top: 3, bottom: 15),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       hintText: "Search Here...",
            //       hintStyle: TextStyle(color: Colors.black),
            //       contentPadding: const EdgeInsets.only(top: 13),
            //       prefixIcon: const Icon(Icons.search),
            //     ),
            //   ),
            // )
          ],
        ));
  }
}

