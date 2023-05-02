// ignore_for_file: file_names, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohmypet_res/Widgets/formulario/formPage.dart';
import 'package:ohmypet_res/Widgets/login/loginPage.dart';

class authPage extends StatelessWidget {
  const authPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //Usuario Logueado
            return formPage();
          } else {
            //Usuario no Logueado
            return const loginPage();
          }
        },
      ),
    );
  }
}
