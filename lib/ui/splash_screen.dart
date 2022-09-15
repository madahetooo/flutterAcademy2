import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_course/home_page.dart';
import 'package:flutter_course/auth/login.dart';
import 'package:flutter_course/main.dart';
import 'package:flutter_course/tabbar_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();

    Timer(Duration(seconds: 3),() =>
       Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => TabbarWidget())));
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
