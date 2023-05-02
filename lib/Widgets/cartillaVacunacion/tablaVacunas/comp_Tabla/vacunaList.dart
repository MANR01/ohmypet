// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Clases/Vacuna.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_vacuna.dart';

class vacunaList extends StatefulWidget {
  final Vacuna vacuna;

  const vacunaList(this.vacuna);

  @override
  State<vacunaList> createState() => _vacunaListState();
}

class _vacunaListState extends State<vacunaList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _setInformacion(context, widget.vacuna);
                    setState(() {});
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 35),
                      child: SizedBox(
                          width: 50,
                          child: Text(
                            widget.vacuna.nomVacuna,
                            style: const TextStyle(fontSize: 16),
                          ))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                      width: 100,
                      child: Text(
                        widget.vacuna.fechApli,
                        style: const TextStyle(fontSize: 16),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                      width: 90,
                      child: Text(widget.vacuna.fechProx,
                          style: const TextStyle(fontSize: 16))),
                ),
              ],
            )
          ]),
    );
  }
}

Future<void> _setInformacion(BuildContext context, Vacuna vacuna) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(174, 240, 145, 36),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vacuna: ${vacuna.nomVacuna}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Dosis: ${vacuna.dosis}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Estado: ${vacuna.estado}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Aplicación: ${vacuna.fechApli}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Proxima Aplicación: ${vacuna.fechProx}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    label: const Text('Editar',
                        style: TextStyle(color: Colors.white))),
                TextButton.icon(
                    onPressed: () async {
                      await DB_V.instance
                          .delete(vacuna.nomVacuna)
                          .then((value) => Navigator.pop(context));
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    label: const Text('Eliminar',
                        style: TextStyle(color: Colors.white)))
              ],
            )
          ],
        );
      });
}
