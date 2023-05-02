// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Widgets/cartillaVacunacion/cvPage.dart';

class comp_CV extends StatelessWidget {
  const comp_CV({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const cvPage())),
      child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          color: const Color.fromARGB(
              211, 247, 190, 116),
          child: Row(
            children: [
             Image.asset(
              'assets/icons/cartilla-vacunacion-icon.png',
              width: 30,
            ),
              const SizedBox(
                width: 10,
              ),
              const Text("Cartilla de Vacunación")
            ],
          )),
    );
  }
}
