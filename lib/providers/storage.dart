import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> write(StorageItem item) async {
    await _secureStorage.write(
      key: item.key,
      value: item.value,
    );
  }
}
