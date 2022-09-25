import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/auth/login.dart';
import 'package:flutter_course/auth/register.dart';
import 'package:flutter_course/firebase_options.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Flutter Academy"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.login),
                  text: "Login",
                ),
                Tab(
                  icon: Icon(Icons.app_registration),
                  text: "Register",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Login(),
              Register(),
            ],
          ),
        ),
      ),
    );
  }
}
