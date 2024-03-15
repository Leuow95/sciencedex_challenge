import '../../entities/period_entity.dart';

abstract class ConfigurationState {}

class ConfigurationInitialState implements ConfigurationState {}

class ConfigurationLoadingState implements ConfigurationState {}

class ConfigurationLoadedState implements ConfigurationState {
  final List<PeriodEntity> periods;

  ConfigurationLoadedState(this.periods);
}

class ConfigurationFailureState implements ConfigurationState {}

class ConfigurationEmptyState implements ConfigurationState {}
