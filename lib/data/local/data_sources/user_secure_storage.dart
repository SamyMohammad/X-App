import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _instance = FlutterSecureStorage();
  static const _tokenKey = 'token';

  static Future<void> write({required String value}) async {
    await _instance.write(key: _tokenKey, value: value);
  }

  static Future<String?> read() async {
    return await _instance.read(key: _tokenKey);
  }

  static Future<void> delete() async {
    await _instance.delete(key: _tokenKey);
  }
}