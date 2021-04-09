import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HumidityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HumidityPageState();
}

class _HumidityPageState extends State<HumidityPage> {
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
        title: Text('Humidity'),
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
              height: 300,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Humidity is',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: Colors.blue[600]),
                  ),
                  Text(
                    '80%',
                    style: TextStyle(fontSize: 100, color: Colors.blue[800]),
                  )
                ],
              ),
            ),
          );
  }
}
