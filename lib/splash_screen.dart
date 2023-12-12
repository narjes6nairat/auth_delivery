import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, '/login');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Your existing SplashScreen widget code...
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/delivery_food.gif",
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Food Delivery",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),
              ],
    ),
    ),

          const Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Developed by auxilim team",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
