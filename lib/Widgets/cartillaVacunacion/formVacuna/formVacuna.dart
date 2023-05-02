// ignore_for_file: unused_import, file_names, camel_case_types, unused_element, unnecessary_new

import 'package:flutter/material.dart';
import 'package:ohmypet_res/Clases/Vacuna.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_mascots.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_vacuna.dart';
import 'package:ohmypet_res/Widgets/cartillaVacunacion/cvPage.dart';

import 'camp_Formulario/_inputCabezera.dart';
import 'camp_Formulario/_inputNomV.dart';
import 'camp_Formulario/_inputDosis.dart';
import 'camp_Formulario/_inputEstado.dart';
import 'camp_Formulario/_inputFechaA.dart';
import 'camp_Formulario/_inputFechaP.dart';

class formVacuna extends StatefulWidget {
  const formVacuna({super.key});

  @override
  State<formVacuna> createState() => _formVacunaState();
}

class _formVacunaState extends State<formVacuna> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController vacunaValue = TextEditingController();
  final TextEditingController dosisValue = TextEditingController();
  final TextEditingController estadoValue = TextEditingController();
  final TextEditingController fetchAValue = TextEditingController();
  final TextEditingController fetchPValue = TextEditingController();

  @override
  void dispose() {
    _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(240, 144, 36, 6),
        shape: const StadiumBorder());

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Fondo.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // ignore: prefer_const_literals_to_create_immutables
          backgroundColor: const Color.fromRGBO(240, 144, 36, 1),
          bottomOpacity: 0,
          elevation: 0,
          title: const Text(''),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const getCabezera(),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(195, 204, 115, 0.616),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        getNomV(
                          controller: vacunaValue,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        getDosis(
                          controller: dosisValue,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        getEstado(
                          controller: estadoValue,
                        ),
                        const SizedBox(height: 15),
                        getFechaA(
                          controller: fetchAValue,
                        ),
                        const SizedBox(height: 15),
                        getFechaP(
                          controller: fetchPValue,
                        ),
                        const SizedBox(height: 15),
                        _nextButton(context, elevatedButtonStyle),
                        const SizedBox(height: 15)
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _nextButton(BuildContext context, ButtonStyle elevatedButtonStyle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: MediaQuery.of(context).size.width - 80,
      child: OutlinedButton.icon(
        icon: const Icon(Icons.storage_rounded),
        style: elevatedButtonStyle,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await DB_V.instance
                .insert(Vacuna(
                    nomVacuna: vacunaValue.text,
                    dosis: dosisValue.text,
                    estado: estadoValue.text,
                    fechApli: fetchAValue.text,
                    fechProx: fetchPValue.text))
                .then((value) => _setMensaje(context));
          }
        },
        label: const Text("Guardar"),
      ),
    );
  }
}

Future<void> _setMensaje(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        // ignore: prefer_const_constructors
        return AlertDialog(
          backgroundColor: const Color.fromARGB(174, 240, 145, 36),
          content: const Text(
            "Vacuna registrada correctamente",
            style: TextStyle(color: Color.fromRGBO(195, 204, 115, 1)),
          ),
          actions: [
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const cvPage()));
                  },
                  child: const Text("Ok",
                      style:
                          TextStyle(color: Color.fromRGBO(195, 204, 115, 1)))),
            )
          ],
        );
      });
}
