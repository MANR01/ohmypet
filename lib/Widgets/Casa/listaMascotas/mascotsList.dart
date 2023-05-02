// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Clases/Mascots.dart';

class mascotsList extends StatelessWidget {
  final Mascots mascots;
  const mascotsList(this.mascots);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(195, 204, 115, 0.425),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 18),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(800),
                  child: Image.asset(
                    'assets/icons/icon-huella.png',
                    width: 60,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Container(
                      //Nombre de la Mascota
                      child: Text(
                        mascots.name,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // Especie de la Mascota
                          child: Text(mascots.esp,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white)),
                        ),
                        Container(
                          // Edad de la Mascota
                          child: Text(' de ${mascots.edad} años',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
