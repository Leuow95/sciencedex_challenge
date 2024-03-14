import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/configuration_page.dart';

class ConfigurationModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => const ConfigurationPage()),
      ];
}
