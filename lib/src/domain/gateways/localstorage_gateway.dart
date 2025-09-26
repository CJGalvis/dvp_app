import 'package:double_v_partners_app/src/domain/usecases/localstorage_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageGateway implements LocalStorageUseCase {
  final SharedPreferences sharedPreferences;

  LocalStorageGateway(this.sharedPreferences);

  @override
  Future<void> save(String key, dynamic value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  Future<String?> getOne(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<void> delete(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> clearAll() async {
    await sharedPreferences.clear();
  }

  @override
  Future<List<String>> getAll() async {
    final List<String> allItemsList = [];

    for (var key in sharedPreferences.getKeys()) {
      final value = sharedPreferences.get(key);
      if (value != null) {
        allItemsList.add(value as String);
      }
    }

    return allItemsList;
  }
}
