// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Services/Firebase/firebase_auth_methods.dart';
import '../comp_MenuLat/_inputANace.dart';
import '../comp_MenuLat/_inputCV.dart';
import '../comp_MenuLat/_inputForm.dart';
import '../comp_MenuLat/_inputInicio.dart';
import '../comp_MenuLat/_inputSOS.dart';
import '../comp_MenuLat/_inputUserIMG.dart';
import 'listaMascotas/listaMascotas.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
                  comp_UserIMG(),
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
                            final snackBar = SnackBar(
                              backgroundColor:
                                  const Color.fromARGB(216, 240, 145, 36),
                              content: const Text(
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
            title: Row(
              children: [
                Image.asset(
                  'assets/logos/Logo.png',
                  width: 50,
                ),
                const SizedBox(
                  width: 60,
                ),
                const Text(
                  'Casa',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          body: Container(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: listaMascotas(),
            ),
          ),
        ));
  }

  void signOut() {
    Navigator.pop(context);
    FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
  }
}
