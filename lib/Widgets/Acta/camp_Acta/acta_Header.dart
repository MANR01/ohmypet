// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: 110,
              height: 110,
              child: Image.asset('assets/Logo.png'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.black)),
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Center(
                  child: SizedBox(
                      child: Text(
                    'Registro Animal',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}