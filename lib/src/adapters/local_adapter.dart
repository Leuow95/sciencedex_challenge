abstract class LocalAdapter {
  Future get(String key);
  Future<T> save<T>({
    required String key,
    required T data,
  });
  Future update();
  Future delete();
}
