import 'dart:convert';

import 'package:sciencedex_challenge/src/adapters/local_adapter.dart';
import 'package:sciencedex_challenge/src/features/configuration/service/configuration_service.dart';

import '../../../adapters/local_adapter_impl.dart';
import '../entities/period_entity.dart';

class ConfigurationServiceImpl implements ConfigurationService {
  final LocalAdapter localAdapter;

  ConfigurationServiceImpl({required this.localAdapter});

  @override
  Future<List<PeriodEntity>> getConfiguration() async {
    final response = await localAdapter.get(SharedPrefsKeys.configuration);

    if (response == null) return [];

    final List<dynamic> jsonList = jsonDecode(response);
    final periods = jsonList.map((json) => PeriodEntity.fromJson(response)).toList();

    return periods;
  }

  @override
  Future<void> addPeriod({required PeriodEntity period}) async {
    await localAdapter.save(
      key: SharedPrefsKeys.configuration,
      data: period.toJson(),
    );
  }
}
