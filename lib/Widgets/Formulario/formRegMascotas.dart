// ignore_for_file: file_names, camel_case_types, sized_box_for_whitespace, depend_on_referenced_packages, body_might_complete_normally_nullable, unused_element, unused_local_variable, unused_import, invalid_use_of_visible_for_testing_member, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ohmypet_res/Clases/Mascots.dart';
import 'package:ohmypet_res/Services/Provider/provider.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_mascots.dart';
import 'package:ohmypet_res/Services/Shared_Preferences/mascotsPreferences.dart';
import 'package:ohmypet_res/Widgets/Acta/actaPage.dart';
import 'package:ohmypet_res/Widgets/Casa/homePage.dart';
import 'package:provider/provider.dart';

import 'camp_Formulario/_inputEspecie.dart';
import 'camp_Formulario/_inputRaza.dart';
import 'camp_Formulario/_inputNombre.dart';
import 'camp_Formulario/_inputEdad.dart';
import 'camp_Formulario/_inputFechaN.dart';
import 'camp_Formulario/_inputPadre.dart';
import 'camp_Formulario/_inputMadre.dart';

class formMascots extends StatelessWidget {
  final TextEditingController espValue = TextEditingController();
  final TextEditingController razaValue = TextEditingController();
  final TextEditingController nomValue = TextEditingController();
  final TextEditingController edadValue = TextEditingController();
  final TextEditingController fechValue = TextEditingController();
  final TextEditingController padreValue = TextEditingController();
  final TextEditingController madreValue = TextEditingController();

  formMascots({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(240, 144, 36, 6),
        shape: const StadiumBorder());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(195, 204, 115, 0.616),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            getEspecie(
              controller: espValue,
            ),
            const SizedBox(
              height: 15,
            ),
            getRaza(
              controller: razaValue,
            ),
            const SizedBox(
              height: 15,
            ),
            getNombre(controller: nomValue),
            const SizedBox(
              height: 15,
            ),
            getEdad(controller: edadValue),
            const SizedBox(
              height: 15,
            ),
            getFechaN(controller: fechValue),
            const SizedBox(
              height: 15,
            ),
            getPadre(controller: padreValue),
            const SizedBox(
              height: 15,
            ),
            getMadre(controller: madreValue),
            const SizedBox(
              height: 15,
            ),
            _nextButton(context, elevatedButtonStyle),
            const SizedBox(
              height: 15,
            )
          ],
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
          if (formKey.currentState!.validate()) {
            context.read<mascotsProvider>().setCamp(
                esp: espValue.text,
                raza: razaValue.text,
                nom: nomValue.text,
                edad: edadValue.text,
                fech: fechValue.text,
                padre: padreValue.text,
                madre: madreValue.text);

            await DB.instance
                .insert(Mascots(
                    esp: espValue.text,
                    raza: razaValue.text,
                    name: nomValue.text,
                    edad: int.parse(edadValue.text),
                    fech: fechValue.text,
                    padre: padreValue.text,
                    madre: madreValue.text))
                .then((value) => _setMensaje(context));
          } else {
            if (kDebugMode) {
              print("Ocurrio un error al verificar los campos");
            }
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
            "Mascota registrada correctamente",
            style: TextStyle(color: Color.fromRGBO(195, 204, 115, 1)),
          ),
          actions: [
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homePage()));
                  },
                  child: const Text("Ok",
                      style:
                          TextStyle(color: Color.fromRGBO(195, 204, 115, 1)))),
            )
          ],
        );
      });
}
