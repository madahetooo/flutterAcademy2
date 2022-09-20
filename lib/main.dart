import 'package:flutter/material.dart';
import 'package:flutter_course/ui/splash_screen.dart';
import 'package:flutter_course/world_time_api/ui/choose_location.dart';
import 'package:flutter_course/world_time_api/ui/loading_time.dart';
import 'package:flutter_course/world_time_api/ui/world_time_home.dart';

void main() => runApp(
    MaterialApp(
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => SplashScreen(),
        '/world_time_home': (context) => WorldTimeHome(),
        '/loading_time': (context) => LoadingTime(),
        '/location': (context) => ChooseLocation(),
      },
    ));
