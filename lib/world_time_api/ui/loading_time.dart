import 'package:flutter/material.dart';
import 'package:flutter_course/world_time_api/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingTime extends StatefulWidget {
  const LoadingTime({Key? key}) : super(key: key);

  @override
  State<LoadingTime> createState() => _LoadingTimeState();
}

class _LoadingTimeState extends State<LoadingTime> {

  String time = "Loading";

  void setUpTime() async {
    WorldTime instance = WorldTime(
        location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo');
    await instance.getTime();
    Navigator.pushNamed(context, '/world_time_home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  void initState() {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
