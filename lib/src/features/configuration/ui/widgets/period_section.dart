import 'package:flutter/material.dart';

class PeriodSection extends StatelessWidget {
  final List<String> periods;
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
            color: const Color.fromARGB(255, 22, 61, 216),
          ),
          child: ListView.builder(
            itemCount: periods.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  periods[index],
                  style: const TextStyle(color: Colors.white),
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
            onPressed: null,
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
