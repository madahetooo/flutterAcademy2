import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_course/ui/welcome_screen.dart';
import 'package:flutter_course/world_time_api/ui/loading_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../world_time_api/ui/world_time_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SpinKitFoldingCube(
        color: Colors.white,
      ),
    );
  }
}
