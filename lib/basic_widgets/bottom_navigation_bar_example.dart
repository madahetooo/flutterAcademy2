import 'package:flutter/material.dart';
import 'package:flutter_course/basic_widgets/grid_view_example.dart';
import 'package:flutter_course/basic_widgets/list_view_example.dart';
import 'package:flutter_course/basic_widgets/toast_example.dart';

class BottomNavigatioNBarExample extends StatefulWidget {
  const BottomNavigatioNBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigatioNBarExample> createState() =>
      _BottomNavigatioNBarExampleState();
}

class _BottomNavigatioNBarExampleState
    extends State<BottomNavigatioNBarExample> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final _widgetsExamples = [
    GridViewExample(),
    ListViewExample(),
    ToastExample(),
    ToastExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetsExamples[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_4x4),
            label: 'Grid View',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List View',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app_sharp),
            label: 'Toast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
