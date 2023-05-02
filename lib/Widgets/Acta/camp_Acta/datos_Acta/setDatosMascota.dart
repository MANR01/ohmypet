// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ohmypet_res/Services/Provider/provider.dart';

class datosMascota extends StatelessWidget {
  const datosMascota({super.key});

  @override
  Widget build(BuildContext context) {
    mascotsProvider watch = context.watch<mascotsProvider>();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const Text("Fecha de Nacimiento:"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Text(watch.fech),
                  //widget.fech
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text("Especie:"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Text(watch.esp),
                  //widget.esp
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text("Raza:"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Text(watch.raza),
                  //widget.raza
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text("Nombre:"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Text(watch.nom),
                  //widget.name
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text("Edad:"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Text(watch.edad),
                  //widget.edad
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
