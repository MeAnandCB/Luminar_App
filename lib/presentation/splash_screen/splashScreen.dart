import 'package:flutter/material.dart';

import 'package:lumainar/presentation/signin_method_screen/signin_method_screen.dart';

import '../login_page_screen/logInPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: 1000), // Adjust the duration as per your preference
    );

    _scaleAnimation = Tween<double>(
      begin: 1.5,
      end: 1.3,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat(reverse: true);

    // Simulate a delay before navigating to the home screen
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
            (route) => false);
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            child:
                Container(child: Image.asset("assets/images/dp/Polygon 1.png")),
          ),
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/dp/luminar logo.png")),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child:
                Container(child: Image.asset("assets/images/dp/Group 156.png")),
          ),
        ],
      ),
    );
  }
}
