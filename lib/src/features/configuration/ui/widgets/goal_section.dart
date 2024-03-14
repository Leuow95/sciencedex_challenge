import 'package:flutter/material.dart';

import 'goal_tile.dart';

class GoalSection extends StatelessWidget {
  const GoalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Text("Meta 1: "),
            Spacer(),
            TextGoalField(),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Text("Meta 2: "),
            Spacer(),
            TextGoalField(),
          ],
        ),
      ],
    );
  }
}
