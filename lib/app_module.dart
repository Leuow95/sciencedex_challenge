import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/features/configuration/configuration_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          "/configuration",
          module: ConfigurationModule(),
        )
      ];
}
