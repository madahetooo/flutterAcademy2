import 'package:flutter/material.dart';
import 'package:flutter_course/home_page.dart';
import 'package:flutter_course/ui/splash_screen.dart';
import 'package:flutter_course/tabbar_widget.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => SplashScreen(),
      },
    ));
