import 'package:flutter/material.dart';
class ReverseStringApp extends StatefulWidget {
  const ReverseStringApp({Key? key}) : super(key: key);

  @override
  State<ReverseStringApp> createState() => _ReverseStringAppState();
}

class _ReverseStringAppState extends State<ReverseStringApp> {
  TextEditingController _reverseStringController = TextEditingController();
  String _reversed="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse String App"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _reverseStringController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter a string to reverse"
              ),
            ),
            SizedBox(height: 20.0,),
            if(_reversed != null)...[
              Text(_reversed,
              style: TextStyle(fontSize: 20.0,
                  fontWeight:FontWeight.bold ),),
              SizedBox(height: 15.0,),
            ],
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: (){
                if(_reverseStringController.text.isEmpty) return ;
                setState((){
                 _reversed = reverseString(_reverseStringController.text);
                });
              },
              child: Text("Reverse"),)
          ],
        ),
      ),
    );
  }
}
  String reverseString(String initialWord){
  return initialWord.split('').reversed.join();
  }
