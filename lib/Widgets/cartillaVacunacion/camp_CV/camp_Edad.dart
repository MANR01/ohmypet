// ignore_for_file: unused_import, file_names, camel_case_types, await_only_futures

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Clases/Mascots.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_mascots.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'package:ohmypet_res/Services/Provider/provider.dart';

class getEdad extends StatefulWidget {
  const getEdad({super.key});

  @override
  State<getEdad> createState() => _getEdadState();
}

class _getEdadState extends State<getEdad> {
  //String edad = "";

  @override
  void initState() {
    super.initState();
    //setEdad();
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
          const Text('Edad:',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
                child: Text(watch.edad,
                    style: const TextStyle(color: Colors.white, fontSize: 14))),
          )
        ])
      ]),
    );
  }
}
