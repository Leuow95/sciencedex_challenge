import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/controller/configuration_controller.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/cancel_button.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/goal_section.dart';

import 'add_period_button.dart';

import 'update_alert_data_section.dart';

class UpdateFormDialog extends StatefulWidget {
  final PeriodEntity period;
  const UpdateFormDialog({super.key, required this.period});

  @override
  State<UpdateFormDialog> createState() => _UpdateFormDialog();
}

class _UpdateFormDialog extends State<UpdateFormDialog> {
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
        surfaceTintColor: const Color(0xFFFFFFFF),
        insetPadding: const EdgeInsets.all(8),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        title: const Center(child: Text("Novo Período")),
        content: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: widget.period.name,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hoverColor: Colors.grey,
                  fillColor: const Color(0xFFF5F6FA),
                  filled: true,
                ),
              ),
              const SizedBox(height: 8),
              UpdateAlertDataSection(
                startDate: widget.period.startDate,
                endDate: widget.period.endDate,
                category: widget.period.category,
              ),
              const SizedBox(height: 16),
              GoalSection(
                goal1: widget.period.goal1,
                goal2: widget.period.goal2,
                hasBorder: false,
                onGoalsChanged: (String? goal1Value, String? goal2Value) {
                  setState(() {
                    goal1 = widget.period.goal1;
                    goal2 = widget.period.goal2;
                  });
                },
              ),
            ],
          ),
        ),
        actions: [
          CancelButton(onSubmit: () => _onPop),
          AddPeriodButton(onSubmit: () => onSubmit),
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  Future<void> onSubmit() async {
    Modular.to.pop();
    await configurationController.addPeriod(PeriodEntity(
      name: nameController.text,
      startDate: startDate,
      endDate: endDate,
      goal1: goal1,
      goal2: goal2,
      category: selectedCategory,
    ));
  }

  _onPop() {
    Modular.to.pop();
  }
}
