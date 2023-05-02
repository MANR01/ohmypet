// ignore_for_file: unused_import, avoid_print, unused_local_variable, avoid_function_literals_in_foreach_calls, depend_on_referenced_packages, camel_case_types

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../Clases/Vacuna.dart';

class DB_V {
  static final DB_V instance = DB_V._init();

  static Database? _database;

  DB_V._init();

  final String tableVacunas = 'vacunas';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('vacunas.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableVacunas(id INTEGER PRIMARY KEY AUTOINCREMENT, Vacuna TEXT, Dosis TEXT, Estado TEXT, Aplicación TEXT, Proxima TEXT)");
  }

  Future<void> insert(Vacuna vacunas) async {
    final db = await instance.database;
    await db.insert(tableVacunas, vacunas.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Vacuna>> getAllVacunas() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> mascotsMap = await db.query(tableVacunas);

    return List.generate(mascotsMap.length, (i) {
      return Vacuna(
        nomVacuna: mascotsMap[i]['Vacuna'],
        dosis: mascotsMap[i]['Dosis'],
        estado: mascotsMap[i]['Estado'],
        fechApli: mascotsMap[i]['Aplicación'],
        fechProx: mascotsMap[i]['Proxima'],
      );
    });
  }

  Future<int> delete(String id) async {
    final db = await instance.database;
    return await db.delete(
      tableVacunas,
      where: "Vacuna = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Vacuna vacuna, String id) async {
    final db = await instance.database;
    return await db.update(
      tableVacunas,
      vacuna.toMap(),
      where: "Vacuna = ?",
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
