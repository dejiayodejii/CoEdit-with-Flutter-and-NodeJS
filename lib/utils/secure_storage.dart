import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CdSecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

// Read value
  dynamic getSecuredKeyStoreData(String sKey) async {
    String? value = await storage.read(key: sKey);
    return value;
  }

// Read all values
  dynamic readAllStoreData() async {
    Map<String, String> allValues = await storage.readAll();
    return allValues;
  }

// Delete value
  dynamic deleteKeyStoreData(String sKey) async {
    await storage.delete(key: sKey);
  }

// Delete all
  dynamic deleteAllStorageData() async {
    await storage.deleteAll();
  }

// Write value
  dynamic storeByKey(String sKey, dynamic valueToBeStored) async {
    await storage.write(key: sKey, value: valueToBeStored);
  }
}