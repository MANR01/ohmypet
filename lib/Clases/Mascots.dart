// ignore_for_file: file_names

class Mascots {
  String esp;
  String raza;
  String name;
  int edad;
  String fech;
  String padre;
  String madre;

  Mascots(
      {required this.esp,
      required this.raza,
      required this.name,
      required this.edad,
      required this.fech,
      required this.padre,
      required this.madre});

  Map<String, dynamic> toMap() {
    return {
      'Especie': esp,
      'Raza': raza,
      'Nombre': name,
      'Edad': edad,
      'Nacimiento': fech,
      'Padre': padre,
      'Madre': madre
    };
  }
}
