import 'package:flutter/material.dart';

class AddPeriodButton extends StatelessWidget {
  const AddPeriodButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F278B))),
      child: const Text(
        "Concluir",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
