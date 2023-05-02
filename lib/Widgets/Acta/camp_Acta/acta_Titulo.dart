// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class actaTitulo extends StatelessWidget {
  const actaTitulo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.black)),
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.symmetric(horizontal: 70),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("ACTA DE NACIMIENTO"),
            ],
          ),
        )
      ],
    );
  }
}
