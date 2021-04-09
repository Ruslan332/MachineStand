import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/pages/DevisesPage.dart';
import 'package:lab3/pages/HumidityPage.dart';
import 'package:lab3/pages/LightPage.dart';
import 'package:lab3/pages/TemperaturePage.dart';

import 'constants/Routes.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [
    TemperaturePage(),
    HumidityPage(),
    LightPage(),
    DevicesPage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  button(context, Icons.invert_colors, 'Humidity', Routes.HUMIDITY),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  button(context, Icons.highlight_sharp, 'Light', Routes.LIGHT),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  button(context, Icons.ac_unit_outlined, 'Temperature',
                      Routes.TEMPERATURE),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  button(context, Icons.wifi, 'Connect', Routes.CONNECT),
                ],
              ),
            ),
          );
        },
      ),
      onGenerateRoute: (route) {
        switch (route.name) {
          case Routes.MAIN:
            return MaterialPageRoute(builder: (_) => MyApp());
          case Routes.HUMIDITY:
            return MaterialPageRoute(builder: (_) => HumidityPage());
          case Routes.TEMPERATURE:
            return MaterialPageRoute(builder: (_) => TemperaturePage());
          case Routes.LIGHT:
            return MaterialPageRoute(builder: (_) => LightPage());
          case Routes.CONNECT:
            return MaterialPageRoute(builder: (_) => DevicesPage());
          default:
            return MaterialPageRoute(builder: (_) => MyApp());
        }
      },
    );
  }

  Widget button(BuildContext context, IconData icon, String text, String routeName) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Padding(padding: EdgeInsets.only(right: 20)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => Size.fromHeight(130),
        ),
      ),
    );
  }
}
