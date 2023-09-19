import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStorage {
static var storage = const FlutterSecureStorage();
 static init() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
     storage = FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  static Future<void> writeData({
    required String key,
    required dynamic value,
  }) async {
    
      return await storage.write( key: key, value: value);
    
  }

  static Future<String?> getData({
    required String key,
  }) async{
    return await storage.read(key: key);
  }

  static Future<void> deleteData({
    required String key,
  }) async {
    return await storage.delete(key: key);
  }

}
