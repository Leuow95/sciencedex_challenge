import 'package:sciencedex_challenge/src/features/configuration/entities/configuration_entity.dart';

abstract class ConfigurationService {
  Future<List<PeriodEntity>> getConfiguration();
}
