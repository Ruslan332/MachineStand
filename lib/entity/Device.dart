import 'package:mongo_dart/mongo_dart.dart';

class Device {
  ObjectId _id;
  String _name;


  Device(this._id, this._name);

  ObjectId get id => _id;

  set id(ObjectId value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}