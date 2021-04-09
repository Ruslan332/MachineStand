import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/entity/Device.dart';
import 'package:lab3/service/MongoDbService.dart';

import 'DevicePage.dart';

class DevicesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  Future<List<Device>> _devises;
  MongoDbService _mongoDbService = MongoDbService();

  @override
  void initState() {
    super.initState();
    _initDevices();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Device>>(
        future: _devises,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Devices'),
              ),
              body: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return _getDevice(data[index]);
                  }),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
        // ListView.builder(
        //   itemCount: 5,
        //   itemBuilder: (context, index) {
        //     return _getDevice(index);
        //   },
        // ),
        );
  }

  Widget _getDevice(Device device) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DevicePage()),
          );
        },
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(device.name),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }

  _initDevices() {
    _devises = _mongoDbService.getDevices();
  }
}
