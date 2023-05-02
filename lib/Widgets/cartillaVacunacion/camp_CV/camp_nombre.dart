// ignore_for_file: camel_case_types, must_be_immutable, await_only_futures

import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'package:ohmypet_res/Services/Provider/provider.dart';

class getNombre extends StatefulWidget {
  const getNombre({super.key});

  @override
  State<getNombre> createState() => _getNombreState();
}

class _getNombreState extends State<getNombre> {
  //String nombre = "";

  @override
  void initState() {
    super.initState();
    //setNombre();
  }

  @override
  Widget build(BuildContext context) {
    mascotsProvider watch = context.watch<mascotsProvider>();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: const Color.fromARGB(255, 240, 145, 36))),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(children: [
          const Text(
            'Nombre:',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
                child: Text(
              watch.nom,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            )),
          )
        ])
      ]),
    );
  }

  /*void setNombre() async {
    SharedPreferences dato = await SharedPreferences.getInstance();
    nombre = (await dato.getString('Nombre'))!;
  }*/
}
