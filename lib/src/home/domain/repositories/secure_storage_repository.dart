import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageRepository {
  Future<void> writeData({required String key, required String value});
  Future<String?> readData({required String key});
  Future<void> deleteData({required String key});
}

class FlutterSecureStorageRepository implements SecureStorageRepository {
  final _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> writeData({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> readData({required String key}) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  @override
  Future<void> deleteData({required String key}) async {
    await _secureStorage.delete(key: key);
  }
}
