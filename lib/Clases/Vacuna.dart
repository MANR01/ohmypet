// ignore_for_file: file_names

class Vacuna {
  String nomVacuna;
  String dosis;
  String estado;
  String fechApli;
  String fechProx;

  Vacuna(
      {required this.nomVacuna,
      required this.dosis,
      required this.estado,
      required this.fechApli,
      required this.fechProx});

  Map<String, dynamic> toMap() {
    return {
      'Vacuna': nomVacuna,
      'Dosis': dosis,
      'Estado': estado,
      'Aplicación': fechApli,
      'Proxima': fechProx
    };
  }
}
