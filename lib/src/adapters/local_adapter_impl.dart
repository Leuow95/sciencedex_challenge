import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/configuration/entities/period_entity.dart';
import 'local_adapter.dart';

class SharedPrefsKeys {
  static const configuration = "CONFIGURATION";
}

class LocalAdapterImpl implements LocalAdapter {
  @override
  Future<List<dynamic>> get(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();

    List<String>? jsonStringList = sharedPrefs.getStringList(key);
    if (jsonStringList != null) {
      String jsonString = jsonStringList.join();
      return jsonDecode(jsonString);
    }
    return [];
  }

  @override
  Future<void> save<T>({
    required String key,
    required T data,
  }) async {
    try {
      var sharedPrefs = await SharedPreferences.getInstance();
      List<dynamic> existingList = await getAllPeriods(key);
      existingList.add(data);
      final jsonList = existingList.map((item) => jsonEncode(item)).toList();
      sharedPrefs.setStringList(key, jsonList);
    } catch (e) {
      throw Exception("Não foi possível adicionar o perído");
    }
  }

  Future<PeriodEntity?> getPeriodByName(String name) async {
    List<dynamic> periods = await get(SharedPrefsKeys.configuration);

    for (var period in periods) {
      if (period['name'] == name) {
        return PeriodEntity.fromJson(period);
      }
    }
    return null;
  }

  @override
  Future<List<PeriodEntity>> getAllPeriods(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();

    final List<String>? periodsJsonList = sharedPrefs.getStringList(key);

    if (periodsJsonList != null) {
      final periodsList = periodsJsonList.map((jsonString) => jsonDecode(jsonString) as Map<String, dynamic>).toList();

      final periodsEntityList = periodsList.map((item) => PeriodEntity.fromJson(item)).toList();
      return periodsEntityList;
    }
    return [];
  }

  @override
  Future delete() {
    throw UnimplementedError();
  }

  @override
  Future update() {
    throw UnimplementedError();
  }

  @override
  Future clear() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
  }
}
