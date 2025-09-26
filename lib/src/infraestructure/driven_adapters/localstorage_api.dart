import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/gateways/localstorage_gateway.dart';

class LocalStorageApi {
  static LocalStorageGateway? _repository;
  static LocalStorageApi _instance = LocalStorageApi._();

  LocalStorageApi._();

  static LocalStorageApi get instance => _instance;

  static void overrideInstance(LocalStorageApi newInstance) {
    _instance = newInstance;
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _repository = LocalStorageGateway(prefs);
  }

  Future<void> save(String key, dynamic value) async {
    await _repository?.save(key, value);
  }

  Future<String?> get(String key) async {
    return await _repository?.getOne(key);
  }

  Future<List<String>> getAllAsList() async {
    return await _repository?.getAll() ?? [];
  }

  static Future<void> clear() async {
    await _repository?.clearAll();
  }
}
