// ignore_for_file: file_names, camel_case_types, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:ohmypet_res/Clases/Mascots.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_mascots.dart';
import 'mascotsList.dart';

class listaMascotas extends StatefulWidget {
  const listaMascotas({super.key});

  @override
  State<listaMascotas> createState() => _listaMascotasState();
}

class _listaMascotasState extends State<listaMascotas> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DB.instance.getAllMascots(),
      builder: (BuildContext context, AsyncSnapshot<List<Mascots>> snapshot) {
        if (snapshot.hasData) {
          List<Mascots> _mascotsList = snapshot.data!;
          return _mascotsList.isEmpty
              ? const Center(
                  child: Text(
                    "No tienes mascotas registradas",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              : Column(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 15),
                        margin: const EdgeInsets.all(8),
                        child: const Text(
                          'Esta es la lista de tus mascotas',
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: 580,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: mascotsList(_mascotsList[index]),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                                      height: 10,
                                      color: Colors.transparent,
                                    ),
                            itemCount: _mascotsList.length),
                      ),
                    ),
                  ],
                );
        } else {
          return const Center(
            child: Text(
              "No tienes mascotas registradas",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
