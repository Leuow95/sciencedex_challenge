import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';

abstract class ConfigurationService {
  Future<List<PeriodEntity>> getConfiguration();
  Future<void> addPeriod({required PeriodEntity period});
  Future<void> deletePeriod({required PeriodEntity period});
}
