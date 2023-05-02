// ignore_for_file: unused_import, file_names, camel_case_types, avoid_unnecessary_containers, prefer_const_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohmypet_res/Widgets/Login/loginPage.dart';
import 'package:ohmypet_res/Widgets/cartillaVacunacion/tablaVacunas/tablaVacunas.dart';
import 'formVacuna/formVacuna.dart';

import '../../Services/Firebase/firebase_auth_methods.dart';
import '../comp_MenuLat/_inputANace.dart';
import '../comp_MenuLat/_inputCV.dart';
import '../comp_MenuLat/_inputInicio.dart';
import '../comp_MenuLat/_inputSOS.dart';
import '../comp_MenuLat/_inputUserIMG.dart';
import '../comp_MenuLat/_inputForm.dart';

import '../cartillaVacunacion/camp_CV/_inputCabezera.dart';
import '../cartillaVacunacion/camp_CV/_inputDatos.dart';

class cvPage extends StatefulWidget {
  const cvPage({super.key});

  @override
  State<cvPage> createState() => _cvPageState();
}

class _cvPageState extends State<cvPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Fondo.png'), fit: BoxFit.cover)),
        child: Scaffold(
          drawer: Drawer(
            child: Container(
              color: const Color.fromRGBO(195, 204, 115, 1),
              child: Column(
                children: [
                  const comp_UserIMG(),
                  const Text("Bienvenido de vuelta",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 12),
                  const comp_Inicio(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_Form(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_ANace(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_CV(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_SOS(),
                  Expanded(child: Container()),
                  Container(
                      padding: const EdgeInsets.all(2),
                      width: double.infinity,
                      color: const Color.fromARGB(216, 240, 145, 36),
                      child: IconButton(
                          onPressed: () {
                            final snackBar = const SnackBar(
                              backgroundColor:
                                  Color.fromARGB(216, 240, 145, 36),
                              content: Text(
                                'Se cerro la Sesión',
                                style: TextStyle(color: Colors.white),
                              ),
                              duration: Duration(seconds: 2),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            signOut();
                          },
                          icon: const Icon(Icons.logout_outlined))),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(195, 204, 115, 1),
            bottomOpacity: 0,
            elevation: 0,
            title: const Text(''),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              //Cabezera de la pantalla
              const getCabezera(),
              const SizedBox(
                height: 20,
              ),

              //Informacion de la mascota
              const getCampos(),
              const SizedBox(height: 20),

              //Tabla con las vacunas de la mascota
              Container(
                  child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: vacunaTable(),
              ))
            ]),
          ),
          floatingActionButton: FloatingActionButton(
              heroTag: 'ruta_formulario',
              backgroundColor: const Color.fromRGBO(240, 144, 36, 6),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const formVacuna())),
              child: const Icon(Icons.add)),
        ));
  }

  void signOut() {
    Navigator.pop(context);
    FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
  }
}
