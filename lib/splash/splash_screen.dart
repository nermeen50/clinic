import 'dart:async';
import 'package:doctor_application/layout/doctor_screen.dart';
import 'package:doctor_application/screens/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  String token;
  SplashScreen({super.key, required this.token});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer for the splash screen
    Timer(const Duration(seconds: 5), () {
      // Navigate to the home screen after the timer ends
      if (widget.token.isNotEmpty || widget.token != '') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LayoutScreen()),
            (route) => false);
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginHomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red[200]!, Colors.white70],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage(
                    'assets/images/health-min.gif',
                  ),
                ),
                // SizedBox(width: 20),
                // CircleAvatar(
                //   radius: 200,
                //   backgroundImage: AssetImage('assets/images/s1.gif'),
                // ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 60,
                color: Colors.red[200],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
