// ignore_for_file: unused_import, file_names, camel_case_types, await_only_futures, unnecessary_string_interpolations

import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'package:ohmypet_res/Services/Provider/provider.dart';

class getFecha extends StatefulWidget {
  const getFecha({super.key});

  @override
  State<getFecha> createState() => _getFechaState();
}

class _getFechaState extends State<getFecha> {
  //String fech = "";

  @override
  void initState() {
    super.initState();
    //setFech();
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
          const Text('F. Nacimiento:',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
                child: Text(watch.fech,
                    style: const TextStyle(color: Colors.white, fontSize: 14))),
          )
        ])
      ]),
    );
  }

  /*Future<void> setFech() async {
    SharedPreferences dato = await SharedPreferences.getInstance();
    fech = (await dato.getString('Fech'))!;
  }*/
}
