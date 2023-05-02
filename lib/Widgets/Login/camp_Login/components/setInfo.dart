// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class setInfo extends StatelessWidget {
  const setInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No estas registrado?',
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(width: 4),
        const Text(
          'Registrate ahora',
          style: TextStyle(
              color: Color.fromRGBO(240, 145, 36, 1),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
