// ignore_for_file: unused_import, camel_case_types, file_names

import 'package:flutter/material.dart';

class cabezeraPadres extends StatelessWidget {
  const cabezeraPadres({super.key});

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
            children: const [Text("Datos de los Padres")]));
  }
}
