// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

Future<void> guardarDatos(nombre, fech, edad) async {
  SharedPreferences datos = await SharedPreferences.getInstance();

  await datos.setString('Nombre', nombre);
  await datos.setString('Fech', fech);
  await datos.setString('Edad', edad);
}
