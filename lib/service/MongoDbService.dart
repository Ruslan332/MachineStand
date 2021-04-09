import 'package:lab3/entity/Device.dart';

import 'DbConnection.dart';

class MongoDbService {
  DBConnection _dbConnection = DBConnection.getInstance();
  static final String _COLLECTION_NAME = "devices";

  Future<List<Device>> getDevices() {
    return _dbConnection.getConnection().then((value) {
      var collection = value.collection(_COLLECTION_NAME);
      return collection.find().map((element) {
        print(element);
        return Device(element["_id"], element["name"]);
      }).toList();
    }).catchError((error, stackTrace) {
      print("Error: $error");
      return Future.value(List.empty());
    });
  }
}
