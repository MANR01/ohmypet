// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Widgets/Acta/actaPage.dart';

class comp_ANace extends StatelessWidget {
  const comp_ANace({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => actaPage())),
      child: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          color: const Color.fromARGB(
              211, 247, 190, 116),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/certificate-icon-outline-style-vector.png',
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Acta de Nacimiento")
            ],
          )),
    );
  }
}
