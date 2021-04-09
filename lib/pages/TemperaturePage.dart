import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  bool _isConnected;

  @override
  void initState() {
    super.initState();
    _isConnected = Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature'),
      ),
      body: getWidget(),
    );
  }

  Widget getWidget() {
    return !_isConnected
        ? Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'No Connection',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Colors.blue[600]),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Icon(
              Icons.wifi_off_outlined,
              color: Colors.blue,
              size: 45,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text(
              'Try Again!',
              style: TextStyle(fontSize: 35, color: Colors.blue[800]),
            )
          ],
        ),
      ),
    )
        : Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        height: 350,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'The temperature is',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: Colors.blue[600]),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(
              '16°C',
              style: TextStyle(fontSize: 80, color: Colors.blue[800]),
            )
          ],
        ),
      ),
    );
  }
}
