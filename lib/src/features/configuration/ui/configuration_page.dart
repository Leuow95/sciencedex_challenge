import 'package:flutter/material.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/search_section.dart';

import 'widgets/logout_section.dart';
import 'widgets/period_section.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const periods = ["Period1", "Period2"];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(),
            SizedBox(height: 16),
            Divider(height: 1),
            PeriodSection(periods: periods),
            LogoutSection(),
          ],
        ),
      ),
    );
  }
}
