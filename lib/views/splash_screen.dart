import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsnow/views/bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Wait 3 seconds then go to main screen
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/news.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // App Name
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'News',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  'Now',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Tagline
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'Stay Updated, Stay Informed',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
