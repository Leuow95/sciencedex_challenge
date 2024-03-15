import 'package:flutter/material.dart';

import 'goal_tile.dart';

class GoalSection extends StatelessWidget {
  final Function(String?, String?) onGoalsChanged;

  const GoalSection({Key? key, required this.onGoalsChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            const Text("Meta 1: "),
            const Spacer(),
            TextGoalField(onValueChanged: (value) => onGoalsChanged(value, null)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Meta 2: "),
            const Spacer(),
            TextGoalField(onValueChanged: (value) => onGoalsChanged(null, value)),
          ],
        ),
      ],
    );
  }
}
