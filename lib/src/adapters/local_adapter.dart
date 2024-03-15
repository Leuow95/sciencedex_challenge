abstract class LocalAdapter {
  Future get(String key);
  Future save();
  Future update();
  Future delete();
}
