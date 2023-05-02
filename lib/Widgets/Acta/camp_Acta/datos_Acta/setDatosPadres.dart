// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ohmypet_res/Services/Provider/provider.dart';

class datosPadres extends StatelessWidget {
  const datosPadres({super.key});

  @override
  Widget build(BuildContext context) {
    mascotsProvider watch = context.watch<mascotsProvider>();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black)),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Nombre del Padre:"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                child: Text(watch.padre),
                //widget.padre
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Nombre de la Madre:"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                child: Text(watch.madre),
                //widget.madre
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}
