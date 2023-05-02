// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class getUser extends StatelessWidget {
  final controller;
  final bool obscureText;
  const getUser({super.key, this.controller, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: const Color.fromARGB(255, 240, 145, 36))),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          textAlign: TextAlign.center,
          obscureText: obscureText,
          style: const TextStyle(fontSize: 18, color: Colors.white),
          decoration: const InputDecoration(
              border: InputBorder.none,
              label: Text(
                "Usuario",
                style: TextStyle(color: Colors.white),
              ),
              prefixIcon: Icon(
                Icons.person_sharp,
                color: Color.fromRGBO(240, 144, 36, 6),
              )),
          validator: (value) {
            if (value!.isEmpty ||
                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return "Este campo no puede estar vacio";
            }
            return null;
          },
        ));
  }
}
