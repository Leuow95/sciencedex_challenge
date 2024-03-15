import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final Function onSubmit;

  const CancelButton({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit(),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFF0000))),
      child: const Text(
        "Excluir",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
