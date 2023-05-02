// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class comp_SOS extends StatelessWidget {
  const comp_SOS({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        color: const Color.fromARGB(211, 247, 190, 116),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/sos-alert-icon.png',
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("S.O.S")
          ],
        ));
  }
}
