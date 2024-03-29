import 'package:sciencedex_challenge/src/adapters/local_adapter.dart';
import 'package:sciencedex_challenge/src/features/configuration/service/configuration_service.dart';

import '../../../adapters/local_adapter_impl.dart';
import '../entities/period_entity.dart';

class ConfigurationServiceImpl implements ConfigurationService {
  final LocalAdapter localAdapter;

  ConfigurationServiceImpl({required this.localAdapter});

  @override
  Future<List<PeriodEntity>> getConfiguration() async {
    final periods = await localAdapter.getAllPeriods(SharedPrefsKeys.configuration);

    return periods;
  }

  @override
  Future<void> addPeriod({required PeriodEntity period}) async {
    await localAdapter.save(
      key: SharedPrefsKeys.configuration,
      data: period,
    );
  }

  @override
  Future<void> deletePeriod({required PeriodEntity period}) async {
    await localAdapter.delete(period.name);
  }
}
