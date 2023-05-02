// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class getPadre extends StatelessWidget {
  final controller;
  const getPadre({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.lightGreen)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.words,
        maxLength: 15,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        decoration: const InputDecoration(
          border: InputBorder.none,
          label: Text(
            "Nombre del Padre",
            style: TextStyle(color: Colors.white),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return "Campo vacio o con numeros";
          }
          return null;
        },
      ),
    );
  }
}