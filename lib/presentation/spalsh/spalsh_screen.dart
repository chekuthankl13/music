import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music/presentation/home/getstarted_Screen.dart';
import 'package:music/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  // ..repeat(reverse: true);
  late final Animation<double> _animation2 = CurvedAnimation(
    parent: _controller2,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
        builder: (context) => const GetstartedScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ScaleTransition(
            scale: _animation2,
            child: const Icon(
              Icons.music_note_outlined,
              color: Colors.white,
              size: 100,
            ),
          ),
        ));
  }
}
