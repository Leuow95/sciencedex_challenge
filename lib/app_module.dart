import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/adapters/local_adapter.dart';
import 'package:sciencedex_challenge/src/adapters/local_adapter_impl.dart';
import 'package:sciencedex_challenge/src/features/configuration/configuration_module.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/configuration_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<LocalAdapter>((i) => LocalAdapterImpl()),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: ((context, args) => const ConfigurationPage())),
        ModuleRoute("/configuration", module: ConfigurationModule()),
      ];
}
