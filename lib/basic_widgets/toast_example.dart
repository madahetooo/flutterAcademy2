import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastExample extends StatefulWidget {
  const ToastExample({Key? key}) : super(key: key);

  @override
  State<ToastExample> createState() => _ToastExampleState();
}

class _ToastExampleState extends State<ToastExample> {
  void showToast() {
    Fluttertoast.showToast(
        msg: "This is toast notification",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        fontSize: 15.0,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast Example"),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text("Show Toast"),
          onPressed: showToast,
        ),
      ),
    );
  }
}
