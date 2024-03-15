import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/controller/configuration_controller.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/goal_section.dart';

import 'add_period_button.dart';
import 'alert_data_section.dart';

class PeriodFormDialog extends StatefulWidget {
  const PeriodFormDialog({super.key});

  @override
  State<PeriodFormDialog> createState() => _PeriodFormDialogState();
}

class _PeriodFormDialogState extends State<PeriodFormDialog> {
  final configurationController = Modular.get<ConfigurationController>();
  final nameController = TextEditingController();
  var name = "";
  var startDate = DateTime(0);
  var endDate = DateTime(0);
  var selectedCategory = "";
  var goal1 = -1;
  var goal2 = -1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => AlertDialog(
        backgroundColor: const Color(0xFFFFFFFF),
        insetPadding: const EdgeInsets.all(8),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        title: const Center(child: Text("Novo Período")),
        content: Container(
          width: constraints.maxWidth * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Nomeie seu período"),
                ),
                const SizedBox(height: 8),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6FA),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: AlertDataSection(onSubmitData: (DateTime? start, DateTime? end, String? category) {
                      setState(() {
                        startDate = start ?? startDate;
                        endDate = end ?? endDate;
                        selectedCategory = category ?? selectedCategory;
                      });
                    })),
                const SizedBox(height: 16),
                GoalSection(
                  onGoalsChanged: (String? goal1Value, String? goal2Value) {
                    setState(() {
                      goal1 = goal1Value != null ? int.parse(goal1Value) : goal1;
                      goal2 = goal2Value != null ? int.parse(goal2Value) : goal2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [AddPeriodButton(onSubmit: () => onSubmit)],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  Future<void> onSubmit() async {
    await configurationController.addPeriod(PeriodEntity(
      name: nameController.text,
      startDate: startDate,
      endDate: endDate,
      goal1: goal1,
      goal2: goal2,
    ));
    Modular.to.pop();
  }
}
