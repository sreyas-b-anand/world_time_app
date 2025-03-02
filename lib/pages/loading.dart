// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", zone: "Europe/Berlin");
    await instance.getTime();
    //print(instance.time);
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag,
      "isDaytime": instance.isDaytime
    } as Map);
  }

  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitWave(
      color: Colors.blueAccent,
    )));
  }
}
