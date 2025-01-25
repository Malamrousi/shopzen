import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static SecureStorageService? _instance;
  final FlutterSecureStorage _storage;

  // Private constructor
  SecureStorageService._() : _storage = const FlutterSecureStorage();

  // Singleton instance getter
  static SecureStorageService get instance {
    _instance ??= SecureStorageService._();
    return _instance!;
  }

  // Write data
  Future<void> writeSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Read data
  Future<String?> readSecureData(String key) async {
    return await _storage.read(key: key);
  }

  // Delete data
  Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  // Delete all data
  Future<void> deleteAllSecureData() async {
    await _storage.deleteAll();
  }

  // Check if key exists
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  // Get all keys
  Future<Set<String>> getAllKeys() async {
    Map<String, String> allData = await _storage.readAll();
    return allData.keys.toSet();
  }
}
