import 'package:flutter/material.dart';
import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onSubmit;
  final PeriodEntity period;

  const CancelButton({super.key, required this.onSubmit, required this.period});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFF0000))),
      child: const Text(
        "Excluir",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
