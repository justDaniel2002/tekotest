import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget(
      {super.key, required this.attGr, this.color = Colors.white});

  final dynamic attGr;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: color,
          border: const Border.symmetric(
              horizontal: BorderSide(
                  width: 2, color: Color.fromARGB(255, 241, 241, 241)))),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    attGr['name'] ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ))),
          Flexible(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Text(attGr['value'] ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16)),
              ))
        ],
      ),
    );
  }
}
