// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';

class mascotsProvider with ChangeNotifier {
  String _esp = "";
  String _raza = "";
  String _nom = "";
  String _edad = "";
  String _fech = "";
  String _padre = "";
  String _madre = "";

  String get esp => _esp;
  String get raza => _raza;
  String get nom => _nom;
  String get edad => _edad;
  String get fech => _fech;
  String get padre => _padre;
  String get madre => _madre;

  Future<void> setCamp(
      {required String esp,
      required String raza,
      required String nom,
      required String edad,
      required String fech,
      required String padre,
      required String madre}) async {
    _esp = esp;
    _raza = raza;
    _nom = nom;
    _edad = edad;
    _fech = fech;
    _padre = padre;
    _madre = madre;
    notifyListeners();
  }
}
