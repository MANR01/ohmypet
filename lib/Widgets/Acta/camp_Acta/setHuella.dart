// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class sethuella extends StatelessWidget {
  const sethuella({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.black)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset(
          'assets/icon-huella.png',
          height: 90,
          width: 90,
        ));
  }
}
