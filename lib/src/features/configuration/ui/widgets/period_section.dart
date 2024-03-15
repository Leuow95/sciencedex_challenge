import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sciencedex_challenge/src/features/configuration/entities/period_entity.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/period_form_dialog.dart';
import 'package:sciencedex_challenge/src/features/configuration/ui/widgets/update_period_dialog.dart';

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
        const SizedBox(height: 8),
        const Text(
          "Períodos",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xFFF5F6FA),
          ),
          child: periods.isEmpty
              ? const Center(child: Text("Não há períodos registrados"))
              : ListView.builder(
                  itemCount: periods.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => UpdateFormDialog(
                                period: periods[index],
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black, width: 0.3),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          title: Text(
                            periods[index].name,
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          trailing:
                              Text("${formatDate(periods[index].startDate)} a ${formatDate(periods[index].endDate)}"),
                          tileColor: Colors.white,
                        ),
                      ),
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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F278B)),
            ),
            child: const Text(
              "Adicionar Periodo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  formatDate(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }
}
