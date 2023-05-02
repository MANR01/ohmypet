// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class comp_UserIMG extends StatelessWidget {
  const comp_UserIMG({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      child: Image.asset('assets/Logo.png'),
    );
  }
}
