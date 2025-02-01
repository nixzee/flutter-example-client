import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class HiveStorageService {
  HiveStorageService() {
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter();
  }

  // Get JSON from Storage
  Future<dynamic> get(String key) async {
    await Hive.initFlutter();
    final storageBox = await Hive.openBox('storageBox');
    final value = await storageBox.get(key);
    return value != null ? jsonDecode(value) : null;
  }

  // Put JSON in Storage
  Future<bool> set(String key, dynamic value) async {
    final storageBox = await Hive.openBox('storageBox');
    final jsonValue = jsonEncode(value);
    storageBox.put(key, jsonValue);
    return true;
  }

  // Delete From Storage
  Future<void> delete(String key) async {
    final storageBox = await Hive.openBox('storageBox');
    await storageBox.delete(key);
  }
}
