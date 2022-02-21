import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static final storage = FlutterSecureStorage();

  static Future<String?> readToken(String key) async {
    String? value = await storage.read(key: key);
    return (value != "") ? value : "";
  }

  static Future<String?> saveToken(String value) async {
    await storage.write(key: "token", value: value);
    return "saved";
  }

  static Future<String?> deleteToken() async {
    await storage.delete(key: "token");
    return "removed";
  }
}
