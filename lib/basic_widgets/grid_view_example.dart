import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({Key? key}) : super(key: key);

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  List<String> images = [
    "https://docs.flutter.dev/assets/images/dash/Dash.png",
    "https://docs.flutter.dev/assets/images/dash/dash-prototypes2.jpg",
    "https://flutter-sy.com/wp-content/uploads/2021/04/word-image-220.png",
    "https://docs.flutter.dev/assets/images/dash/NilayDashPuppet.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridViewExample"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (BuildContext context , int index ){
            return Image.network(images[index]);
            }),
      ),
    );
  }
}
