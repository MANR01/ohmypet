// ignore_for_file: unused_import, file_names, camel_case_types, unused_element, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_vacuna.dart';

import '../../../Clases/Vacuna.dart';
import 'comp_Tabla/vacunaList.dart';

class vacunaTable extends StatefulWidget {
  const vacunaTable({super.key});

  @override
  State<vacunaTable> createState() => _vacunaTableState();
}

class _vacunaTableState extends State<vacunaTable> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DB_V.instance.getAllVacunas(),
        builder: (BuildContext context, AsyncSnapshot<List<Vacuna>> snapshot) {
          if (snapshot.hasData) {
            List<Vacuna> _vacunaList = snapshot.data!;
            return _vacunaList.isEmpty
                ? const Center(
                    child: Text(
                      "No hay vacunas agregadas",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                : Column(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.white, width: 0.5),
                            children: [
                              cabezeras(),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 300,
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    child: vacunaList(_vacunaList[index]));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                        height: 10,
                                        color: Colors.transparent,
                                      ),
                              itemCount: _vacunaList.length),
                        ),
                      )
                    ],
                  );
          } else {
            return const Center(
              child: Text(
                "No hay vacunas agregadas",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            );
          }
        });
  }

  TableRow cabezeras() {
    return TableRow(
        decoration: const BoxDecoration(color: Color.fromRGBO(240, 144, 36, 6)),
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.only(right: 12, left: 20),
              child: const Text('Vacuna',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.only(right: 12, left: 12),
              child: const Text('Aplicación',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text('Proxima',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
          )
        ]);
  }
}
