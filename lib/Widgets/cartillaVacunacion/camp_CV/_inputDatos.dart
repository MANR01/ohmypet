// ignore_for_file: file_names, camel_case_types, override_on_non_overriding_member, must_be_immutable, await_only_futures, unused_local_variable

import 'package:flutter/material.dart';

import 'camp_nombre.dart';
import 'camp_Fecha.dart';
import 'camp_Edad.dart';

class getCampos extends StatefulWidget {
  const getCampos({super.key});

  @override
  State<getCampos> createState() => _getCamposState();
}

class _getCamposState extends State<getCampos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(195, 204, 115, 0.541),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        children: const [
          SizedBox(height: 25),

          //Nombre de la mascota
          getNombre(),

          SizedBox(height: 15),

          //Fecha de Nacimiento
          getFecha(),

          SizedBox(height: 15),

          //Edad de la Mascota
          getEdad(),

          SizedBox(height: 25)
        ],
      ),
    );
  }
}
