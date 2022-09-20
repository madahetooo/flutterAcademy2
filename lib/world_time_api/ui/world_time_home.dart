import 'package:flutter/material.dart';

class WorldTimeHome extends StatefulWidget {
  const WorldTimeHome({Key? key}) : super(key: key);

  @override
  State<WorldTimeHome> createState() => _WorldTimeHomeState();
}

class _WorldTimeHomeState extends State<WorldTimeHome> {
  Map data ={};
  @override
  Widget build(BuildContext context) {
   data =  data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
   print(data);
   String backgroundImage = data['isDayTime'] ?  'day.png' : 'night.png';
   Color backgroundColor = data['isDayTime'] ? Colors.blue : Colors.indigo ;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: Container(
              width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$backgroundImage'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                // ignore: deprecated_member_use
                FlatButton.icon(
                    color: Colors.white,
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    // onPressed: () async {
                    //  dynamic result = await Navigator.pushNamed(context, '/location');
                    //  if(result != null){
                    //    setState((){
                    //      data = {
                    //        'time' : result['time'],
                    //        'location' : result['location'],
                    //        'isDayTime' : result['isDayTime'],
                    //        'flag' : result['flag']
                    //      };
                    //    });
                    //  }
                    // },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Edit Location",
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white,
                      letterSpacing: 5.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
