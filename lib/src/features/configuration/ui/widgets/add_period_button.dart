import 'package:flutter/material.dart';

class AddPeriodButton extends StatelessWidget {
  final Function onSubmit;
  const AddPeriodButton({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit(),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F278B))),
      child: const Text(
        "Concluir",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
