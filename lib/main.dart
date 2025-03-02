import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_loc.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() async{
  
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context) => ChooseLoc(),
    },
  ));
}

