import 'package:flutter/material.dart';

import 'meta_tile.dart';

class PeriodFormDialog extends StatefulWidget {
  const PeriodFormDialog({super.key});

  @override
  State<PeriodFormDialog> createState() => _PeriodFormDialogState();
}

class _PeriodFormDialogState extends State<PeriodFormDialog> {
  DateTime? startDate;
  DateTime? endDate;
  String? selectedCategory;

  List<String> categories = ['Categoria 1', 'Categoria 2', 'Categoria 3', 'Categoria 4', 'Categoria 5'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFFFFFF),
      title: const Center(child: Text("Nova Período")),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color(0xFFFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Nomeie seu período",
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Começa: "),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            _selectDate(true, context);
                          },
                          child: Text(startDate?.toString() ?? "Selecionar data"),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 16),
                    const SizedBox(height: 8),
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text("Termina: "),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            _selectDate(false, context);
                          },
                          child: Text(endDate?.toString() ?? "Selecionar data"),
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
                        PopupMenuButton<String>(
                          onSelected: (String result) {
                            setState(() {
                              selectedCategory = result;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return categories.map((String category) {
                              return PopupMenuItem<String>(
                                value: category,
                                child: Text(category),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text("Meta 1: "),
                  Spacer(),
                  TextMetaField(hintText: "un."),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text("Meta 2: "),
                  Spacer(),
                  TextMetaField(hintText: "un."),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F278B))),
          child: const Text(
            "Concluir",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
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
      });
    }
  }
}
