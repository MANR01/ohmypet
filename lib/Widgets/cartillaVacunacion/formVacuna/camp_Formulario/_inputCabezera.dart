// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class getCabezera extends StatelessWidget {
  const getCabezera({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/Logo.png'),
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/Logo.png'),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: const Center(
                  child: SizedBox(
                child: Text('Registrar Vacuna',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              )),
            ),
          ],
        ),
      ],
    );
  }
}
