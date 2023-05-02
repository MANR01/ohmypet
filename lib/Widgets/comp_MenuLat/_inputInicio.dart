// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Widgets/Casa/homePage.dart';

class comp_Inicio extends StatelessWidget {
  const comp_Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const homePage())),
      child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          color: const Color.fromARGB(
              211, 247, 190, 116), // const Color.fromRGBO(195, 204, 115, 1)
          child: Row(
            children: const [
              Icon(Icons.home),
              SizedBox(
                width: 10,
              ),
              Text("Casa")
            ],
          )),
    );
  }
}
