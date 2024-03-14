import 'package:flutter/material.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/goal_section.dart';

import 'add_period_button.dart';
import 'alert_data_section.dart';

class PeriodFormDialog extends StatefulWidget {
  const PeriodFormDialog({super.key});

  @override
  State<PeriodFormDialog> createState() => _PeriodFormDialogState();
}

class _PeriodFormDialogState extends State<PeriodFormDialog> {
  String name = "";
  // late DateTime? startDate;
  // late DateTime? endDate;
  // late String? selectedCategory;
  // late int? goal1;
  // late int? goal2;

  @override
  void initState() {
    name = "";
    // startDate = DateTime(0);
    // endDate = DateTime(0);
    // selectedCategory = "";
    // goal1 = -1;
    // goal2 = -1;
    super.initState();
  }

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
                  decoration: const InputDecoration(hintText: "Nomeie seu período"),
                ),
                const SizedBox(height: 8),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6FA),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const AlertDataSection(
                        // onSubmitData: savePeriod(),
                        )),
                const SizedBox(height: 16),
                const GoalSection(),
              ],
            ),
          ),
        ),
        actions: const [AddPeriodButton()],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  savePeriod() {}
}
