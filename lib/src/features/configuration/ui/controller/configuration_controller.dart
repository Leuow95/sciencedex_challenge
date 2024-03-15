import 'package:flutter/material.dart';
import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';
import 'package:sciencedex_challenge/src/features/configuration/service/configuration_service.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/controller/configuration_states.dart';

class ConfigurationController extends ValueNotifier<ConfigurationState> {
  final ConfigurationService service;

  ConfigurationController({required this.service}) : super(ConfigurationInitialState());

  Future<void> getPeriods() async {
    value = ConfigurationLoadingState();

    final periods = await service.getConfiguration();

    value = ConfigurationLoadedState(periods);
  }

  Future<void> addPeriod(PeriodEntity period) async {
    value = ConfigurationLoadingState();
    await service.addPeriod(period: period);
    await getPeriods();
  }
}
