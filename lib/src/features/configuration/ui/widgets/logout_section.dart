import 'package:flutter/material.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(radius: 24),
        SizedBox(width: 12),
        // ListTile(title: Text("João")),
        Column(
          children: [
            Text("João"),
            Text("Sair"),
          ],
        )
      ],
    );
  }
}
