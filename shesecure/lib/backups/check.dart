import 'package:flutter/material.dart';
import 'package:shesecure/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: CircleAvatar(radius: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/logo.png', // replace with your logo
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text("SheSecure", style: TextStyle(color: Colors.blue)),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.pink),
                strokeWidth: 5,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
