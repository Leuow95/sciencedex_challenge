import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/features/configuration/service/configuration_service.dart';
import 'package:sciencedex_challenge/src/features/configuration/service/configuration_service_impl.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/configuration_page.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/controller/configuration_controller.dart';

class ConfigurationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<ConfigurationService>((i) => ConfigurationServiceImpl(localAdapter: i())),
        Bind.factory((i) => ConfigurationController(service: i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => const ConfigurationPage()),
      ];
}
