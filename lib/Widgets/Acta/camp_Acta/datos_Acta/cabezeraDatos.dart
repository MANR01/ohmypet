// ignore_for_file: unused_import, file_names, camel_case_types

import 'package:flutter/material.dart';

class cabezeraDatos extends StatelessWidget {
  const cabezeraDatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.black)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [Text("Datos de la Mascota")]));
  }
}