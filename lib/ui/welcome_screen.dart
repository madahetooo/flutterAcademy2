import 'package:flutter/material.dart';
import 'package:flutter_course/tabbar_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              "assets/dashatars.png",
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            const Text(
              "Welcome to our Flutter Academy \n Class Two App",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "You can find multiple ideas in this application \n"
              "like: BMI Calculator, Todolist App, Firebase Chat app and more...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
              ),
            ),
            Spacer(),
            FittedBox(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabbarWidget()));
                },
                child: Row(
                  children: const [
                    Text("Skip"),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
