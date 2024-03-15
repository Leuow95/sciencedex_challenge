import 'dart:convert';

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
  Future<T> save<T>({
    required String key,
    required T data,
  }) async {
    try {
      var sharedPrefs = await SharedPreferences.getInstance();
      final json = jsonEncode(data);
      sharedPrefs.setString(key, json);
      return data;
    } catch (e) {
      throw Exception("Não foi possível adicionar o perído");
    }
  }

  @override
  Future update() {
    throw UnimplementedError();
  }
}
