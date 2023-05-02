// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Widgets/Formulario/formPage.dart';

class comp_Form extends StatelessWidget {
  const comp_Form({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => formPage())),
      child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          color: const Color.fromARGB(
              211, 247, 190, 116),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/form-mascot-icon.png',
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Registro de Mascota")
            ],
          )),
    );
  }
}
