// ignore_for_file: camel_case_types, depend_on_referenced_packages, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class getFechaP extends StatelessWidget {
  final controller;
  const getFechaP({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    var fechmask = MaskTextInputFormatter(
        mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.lightGreen)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        inputFormatters: [fechmask],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "DD/MM/AA",
            label: Text(
              "Proxima Aplicación",
              style: TextStyle(color: Colors.white),
            ),
            prefixIcon: Icon(
              Icons.calendar_month_sharp,
              color: Color.fromRGBO(240, 144, 36, 6),
            )),
        validator: (value) {
          if (value!.isEmpty) {
            return "Campo vacio";
          }
          return null;
        },
      ),
    );
  }
}
