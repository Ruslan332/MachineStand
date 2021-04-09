import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context, "Data successfully sent!"),
                );
              },
              child: Text(
                'Send data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(230, 130),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
            ),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context, "Data successfully received!"),
                );
              },
              child: Text(
                'Get data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(230, 130),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context, String message) {
    return new AlertDialog(
      // title: const Text('Popup example'),
      content: Text(message),
      actions: <Widget>[
        new OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
