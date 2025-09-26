
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/gateways/localstorage_gateway.dart';

class LocalStorageApi {
  static LocalStorageGateway? _repository;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _repository = LocalStorageGateway(prefs);
  }

  static Future<void> save(String key, dynamic value) async {
    await _repository?.save(key, value);
  }

  static Future<String?> get(String key) async {
    return await _repository?.getOne(key);
  }

  static Future<void> delete(String key) async {
    await _repository?.delete(key);
  }

  static Future<void> clear() async {
    await _repository?.clearAll();
  }

  static Future<List<String>> getAllAsList() async {
    return await _repository?.getAll() ?? [];
  }
}
