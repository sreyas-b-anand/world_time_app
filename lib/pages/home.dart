import 'package:flutter/material.dart';
import 'package:world_time_app/components/styled_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  final String iconFont = 'MaterialIcons';
  final String? iconFontPackage = null;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : (ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>);
    final String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg';
    // print(data);
    return Scaffold(
        appBar: StyledAppBar(text: "World Time"),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = result;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_location,
                        size: 20,
                        color: data['isDaytime'] ? Colors.black : Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Edit Location",
                        style: TextStyle(
                          color:
                              data['isDaytime'] ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data['location'],
                              style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 2,
                                color: data['isDaytime']
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            if (data['isDaytime'] == false)
                              Icon(
                                Icons.nightlight,
                                color: data['isDaytime']
                                    ? Colors.black
                                    : Colors.white,
                              )
                            else
                              Icon(
                                Icons.sunny,
                                color: data['isDaytime']
                                    ? Colors.black
                                    : Colors.white,
                              )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          data['time'],
                          style: TextStyle(
                            fontSize: 50,
                            color:
                                data['isDaytime'] ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
