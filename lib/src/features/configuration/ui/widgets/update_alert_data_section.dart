import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateAlertDataSection extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? category;

  const UpdateAlertDataSection({
    Key? key,
    this.startDate,
    this.endDate,
    this.category,
  }) : super(key: key);

  @override
  State<UpdateAlertDataSection> createState() => _UpdateAlertDataSectionState();
}

class _UpdateAlertDataSectionState extends State<UpdateAlertDataSection> {
  List<String> categories = ['Categoria 1', 'Categoria 2', 'Categoria 3', 'Categoria 4', 'Categoria 5'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            const Text("Começa: "),
            const Spacer(),
            Text(widget.startDate != null ? DateFormat("dd/MM/yyyy").format(widget.startDate!) : "Selecionar data")
          ],
        ),
        const SizedBox(height: 16),
        const Divider(height: 1),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Termina: "),
            const Spacer(),
            Text(widget.endDate != null ? DateFormat("dd/MM/yyyy").format(widget.endDate!) : "Selecionar data"),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(height: 1),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Categoria: "),
            const Spacer(),
            Text(widget.category ?? ""),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
