abstract class LocalStorageUseCase {
  Future<void> save(String key, dynamic value);
  Future<dynamic> getOne(String key);
  Future<void> delete(String key);
  Future<void> clearAll();
  Future<List<String>> getAll();
}
