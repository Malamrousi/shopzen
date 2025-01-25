import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  factory SecureStorage() {
    return secureStorage;
  }
  
  SecureStorage._internal();
  
  static final SecureStorage secureStorage = SecureStorage._internal();
  static late FlutterSecureStorage storage;

  Future<dynamic> instantiateSecureStorage() async {
    storage = const FlutterSecureStorage();
  }

  FlutterSecureStorage getStorageInstance() {
    return storage;
  }

  Future<dynamic> writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    return await storage.read(key: key);
  }

  Future<dynamic> deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

  Future<dynamic> deleteAllSecureData() async {
    await storage.deleteAll();
  }

  Future<bool> containsKey(String key) async {
    return await storage.containsKey(key: key);
  }

  Future<Set<String>> getAllKeys() async {
    Map<String, String> allData = await storage.readAll();
    return allData.keys.toSet();
  }
}