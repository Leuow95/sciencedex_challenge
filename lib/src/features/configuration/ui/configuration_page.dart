import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';
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
    var periodsMock = [
      PeriodEntity(name: "name 1", startDate: DateTime(0), endDate: DateTime(0), goal1: 3, goal2: 4),
      PeriodEntity(name: "name 2", startDate: DateTime(0), endDate: DateTime(0), goal1: 6, goal2: 8),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: const Icon(Icons.arrow_back_ios),
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
                    // PeriodSection(periods: state.periods),
                    PeriodSection(periods: periodsMock),
                    const LogoutSection(),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );
  }
}
