import 'package:sciencedex_challenge/src/adapters/local_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const configuration = "CONFIGURATION";
}

class LocalAdapterImpl implements LocalAdapter {
  @override
  Future get(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.get(key);
  }

  @override
  Future delete() {
    throw UnimplementedError();
  }

  @override
  Future save() {
    throw UnimplementedError();
  }

  @override
  Future update() {
    throw UnimplementedError();
  }
}
