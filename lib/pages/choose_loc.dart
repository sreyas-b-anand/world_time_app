// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/components/styled_appbar.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLoc extends StatefulWidget {
  const ChooseLoc({super.key});

  @override
  State<ChooseLoc> createState() => _ChooseLocState();
}

class _ChooseLocState extends State<ChooseLoc> {
  List<WorldTime> locations = [
    WorldTime(zone: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(zone: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(zone: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(zone: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(zone: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(zone: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(zone: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(zone: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag,
      "isDaytime": instance.isDaytime
    } as Map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(text: "Choose a location"),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
