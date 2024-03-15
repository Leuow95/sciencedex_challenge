import '../features/configuration/entities/period_entity.dart';

abstract class LocalAdapter {
  Future get(String key);
  Future<void> save<T>({
    required String key,
    required T data,
  });
  Future<List<PeriodEntity>> getAllPeriods(String key);
  Future clear();

  Future update();
  Future delete();
}
