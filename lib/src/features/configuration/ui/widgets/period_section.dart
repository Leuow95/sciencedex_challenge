import 'package:flutter/material.dart';
import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/period_form_dialog.dart';

class PeriodSection extends StatelessWidget {
  final List<PeriodEntity> periods;
  const PeriodSection({
    super.key,
    required this.periods,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Período"),
        Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xFFF5F6FA),
          ),
          child: ListView.builder(
            itemCount: periods.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  periods[index].name,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                textColor: Colors.white,
                tileColor: Colors.white,
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const PeriodFormDialog(),
              );
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F278B))),
            child: const Text(
              "Adicionar Periodo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
