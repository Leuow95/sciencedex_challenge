import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/controller/configuration_controller.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/controller/configuration_states.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/search_section.dart';

import 'widgets/logout_section.dart';
import 'widgets/period_section.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final configurationController = Modular.get<ConfigurationController>();

  @override
  void initState() {
    configurationController.getPeriods();
    super.initState();
  }

  @override
  void dispose() {
    configurationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () => configurationController.getPeriods(),
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ValueListenableBuilder(
            valueListenable: configurationController,
            builder: ((context, state, child) {
              if (state is ConfigurationLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ConfigurationLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchSection(),
                    const SizedBox(height: 16),
                    const Divider(height: 1),
                    PeriodSection(periods: state.periods),
                    const LogoutSection(),
                  ],
                );
              }
              if (state is ConfigurationFailureState) {
                return const Center(child: Text("Falha ao carregar os períodos"));
              }
              return const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );
  }
}
