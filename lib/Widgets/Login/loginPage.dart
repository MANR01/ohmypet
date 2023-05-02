// ignore_for_file: file_names, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohmypet_res/Services/Firebase/firebase_auth_methods.dart';

import '../Casa/homePage.dart';
import 'camp_Login/components/setCampos.dart';
import 'camp_Login/components/titulo_recuadros.dart';
import 'camp_Login/components/menssage_Continuar.dart';
import 'camp_Login/components/setInfo.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Fondo.png'), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          elevation: 0,
          title: const Text(''),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  //Logo
                  Image.asset(
                    'assets/Logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Mensaje de Bienvenida
                  const Text('Bienvenido',
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                  const SizedBox(
                    height: 25,
                  ),
                  //Llamado al metodo encargado de mostrar los campos del login
                  setCampos(),
                  const SizedBox(
                    height: 25,
                  ),
                  // Mensaje de "O Continuar con"
                  const setMessage(),
                  const SizedBox(
                    height: 35,
                  ),
                  //Botones de inicio de sesión de Google y Facebook
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Boton de Google
                      recuadroTitulo(
                          imagePath: 'assets/google.png',
                          onTap: () => {
                                FirebaseAuthMethods(FirebaseAuth.instance)
                                    .signInWithGoogle(context),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const homePage())),
                              }),
                      const SizedBox(
                        width: 25,
                      ),
                      //Boton de Facebook
                      recuadroTitulo(
                          imagePath: 'assets/facebook.png',
                          onTap: () => {
                                FirebaseAuthMethods(FirebaseAuth.instance)
                                    .singInWithFacebook(context),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const homePage()))
                              }),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  //Mensaje de "¿No estas registrado?, Regístrate ahora"
                  const setInfo(),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
