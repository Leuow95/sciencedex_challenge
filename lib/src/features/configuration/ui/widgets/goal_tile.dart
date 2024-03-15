import 'package:flutter/material.dart';

class TextGoalField extends StatelessWidget {
  final Function(String?) onValueChanged;

  const TextGoalField({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFE4E4E4)),
      ),
      child: SizedBox(
        width: 64,
        height: 18,
        child: TextFormField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "un.",
            hintStyle: TextStyle(color: Color(0xFFE4E4E4)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(2),
            isDense: true,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira um valor';
            }
            return null;
          },
          onChanged: (value) => onValueChanged(value),
        ),
      ),
    );
  }
}
