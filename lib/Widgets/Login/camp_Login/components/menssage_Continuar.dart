// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class setMessage extends StatelessWidget {
  const setMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Color.fromRGBO(240, 144, 36, 6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'O continuar con',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Color.fromRGBO(240, 144, 36, 6),
            ),
          ),
        ],
      ),
    );
  }
}
