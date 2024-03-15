import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlertDataSection extends StatefulWidget {
  final Function(DateTime?, DateTime?, String?) onSubmitData;

  const AlertDataSection({
    super.key,
    required this.onSubmitData,
  });

  @override
  State<AlertDataSection> createState() => _AlertDataSectionState();
}

class _AlertDataSectionState extends State<AlertDataSection> {
  DateTime? startDate;
  DateTime? endDate;
  String? selectedCategory;

  List<String> categories = ['Categoria 1', 'Categoria 2', 'Categoria 3', 'Categoria 4', 'Categoria 5'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Começa: "),
            const Spacer(),
            GestureDetector(
              onTap: () => _selectDate(true, context),
              child: Text(startDate != null ? DateFormat("dd/MM/yyyy").format(startDate!) : "Selecionar data"),
            )
          ],
        ),
        const SizedBox(height: 8),
        const Divider(height: 1),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text("Termina: "),
            const Spacer(),
            GestureDetector(
              onTap: () => _selectDate(false, context),
              child: Text(endDate != null ? DateFormat("dd/MM/yyyy").format(endDate!) : "Selecionar data"),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(height: 1),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text("Categoria: "),
            const Spacer(),
            DropdownButton<String>(
              value: selectedCategory,
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                  widget.onSubmitData(startDate, endDate, selectedCategory);
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            )
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate(bool isStartDate, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
        widget.onSubmitData(startDate, endDate, selectedCategory);
      });
    }
  }
}
