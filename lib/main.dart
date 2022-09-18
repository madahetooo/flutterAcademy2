import 'package:flutter/material.dart';
import 'package:flutter_course/ui/splash_screen.dart';

void main() => runApp(
    MaterialApp(
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => SplashScreen(),
      },
    ));
