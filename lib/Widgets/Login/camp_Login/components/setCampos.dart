// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ohmypet_res/Services/Firebase/firebase_auth_methods.dart';

import 'package:ohmypet_res/Widgets/login/camp_Login/camp_User.dart';
import 'package:ohmypet_res/Widgets/login/camp_Login/camp_password.dart';

import '../../../Casa/homePage.dart';
//import 'package:ohmypet/Widgets/Login/camp_Login/components/_nextButton.dart';

class setCampos extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  var context;
  setCampos({super.key});

  static final _formKey = GlobalKey<FormState>(debugLabel: 'login');

  @override
  Widget build(BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(240, 144, 36, 6),
        shape: const StadiumBorder());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(195, 204, 115, 0.541),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      //Campos de Usuario y Contraseña
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            //Campo de Usuario
            getUser(
              controller: emailController,
              obscureText: false,
            ),
            const SizedBox(
              height: 25,
            ),
            //Campo para la Contraseña
            getPassword(
              controller: passController,
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            //Mensaje de "¿Olvidaste tu Contraseña?"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '¿Olvidaste tu Contraseña?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //Boton para ingresar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width - 80,
              child: OutlinedButton.icon(
                  icon: const Icon(Icons.send),
                  style: elevatedButtonStyle,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signUpUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const homePage()));
                    }
                  },
                  label: const Text("Ingresar")),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Future signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailController.text,
        password: passController.text,
        context: context);
  }
}
