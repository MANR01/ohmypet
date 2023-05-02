// ignore_for_file: file_names, camel_case_types, prefer_const_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohmypet_res/Services/Firebase/firebase_auth_methods.dart';
import '../comp_MenuLat/_inputForm.dart';
import 'formRegMascotas.dart';

import '../Formulario/camp_Formulario/_inputCabezera.dart';

import '../comp_MenuLat/_inputInicio.dart';
import '../comp_MenuLat/_inputCV.dart';
import '../comp_MenuLat/_inputANace.dart';
import '../comp_MenuLat/_inputSOS.dart';
import '../comp_MenuLat/_inputUserIMG.dart';

class formPage extends StatefulWidget {
  final TextEditingController espValue = TextEditingController();
  final TextEditingController razaValue = TextEditingController();
  final TextEditingController nomValue = TextEditingController();
  final TextEditingController fechValue = TextEditingController();
  final TextEditingController padreValue = TextEditingController();
  final TextEditingController madreValue = TextEditingController();

  formPage({super.key});

  @override
  State<formPage> createState() => _formPageState();
}

class _formPageState extends State<formPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          //scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
          scaffoldBackgroundColor: const Color.fromRGBO(247, 191, 116, 70)),
      debugShowCheckedModeBanner: false,
      home: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Fondo.png'), fit: BoxFit.cover)),
          child: const MyHomePage(title: '')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: const Color.fromRGBO(195, 204, 115, 1),
          child: Column(
            children: [
              const comp_UserIMG(),
              const Text("Bienvenido de vuelta",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                          backgroundColor: Color.fromARGB(216, 240, 145, 36),
                          content: Text(
                            'Se cerro la Sesión',
                            style: TextStyle(color: Colors.white),
                          ),
                          duration: Duration(seconds: 2),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        signOut();
                      },
                      icon: const Icon(Icons.logout_outlined))),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        backgroundColor: const Color.fromRGBO(195, 204, 115, 1),
        bottomOpacity: 0,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const getCabezera(),
              const SizedBox(
                height: 20,
              ),
              formMascots(),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  void signOut() {
    Navigator.pop(context);
    FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
  }
}
