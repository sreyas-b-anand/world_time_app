import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String zone;
  bool isDaytime = false ; 

  WorldTime({
    required this.location,
    required this.flag,
    required this.zone,
  });

  Future<void> getTime() async {
    try {
      Uri url =
          Uri.parse("https://timeapi.io/api/Time/current/zone?timeZone=$zone");
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('time')) {
          time = data['time'];

          DateTime now = DateTime.parse(data['dateTime']);

          isDaytime = now.hour >= 6 && now.hour < 18;
          time = DateFormat.jm().format(now);
        } else {
          time = "Time not available";
        }
      } else {
        time = "Error fetching time";
      }
    } catch (e) {
      time = "Failed to load time";
    }
  }
}
