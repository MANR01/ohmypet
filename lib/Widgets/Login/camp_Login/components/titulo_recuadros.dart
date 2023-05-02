// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class recuadroTitulo extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const recuadroTitulo({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(240, 144, 36, 6)),
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 195, 204, 115),
          ),
          child: Image.asset(
            imagePath,
            height: 45,
          )),
    );
  }
}
