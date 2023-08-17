import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManagerProvider {
  static void setToken(String token) {
    const storage = FlutterSecureStorage();
    storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async{
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'token');
  }
}