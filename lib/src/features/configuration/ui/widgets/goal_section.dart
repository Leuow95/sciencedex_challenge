import 'package:flutter/material.dart';

import 'goal_tile.dart';

class GoalSection extends StatelessWidget {
  final int? goal1;
  final int? goal2;
  final bool hasBorder;

  final Function(String?, String?) onGoalsChanged;

  const GoalSection({
    Key? key,
    this.goal1,
    this.goal2,
    required this.onGoalsChanged,
    required this.hasBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            const Text("Meta 1: "),
            const Spacer(),
            TextGoalField(
              onValueChanged: (value) => onGoalsChanged(value, null),
              goalValue: goal1,
              hasBorder: hasBorder,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Meta 2: "),
            const Spacer(),
            TextGoalField(
              onValueChanged: (value) => onGoalsChanged(null, value),
              goalValue: goal2,
              hasBorder: hasBorder,
            ),
          ],
        ),
      ],
    );
  }
}
