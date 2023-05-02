// ignore_for_file: unused_import, avoid_print, unused_local_variable, avoid_function_literals_in_foreach_calls, depend_on_referenced_packages

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../Clases/Mascots.dart';

class DB {
  static final DB instance = DB._init();

  static Database? _database;

  DB._init();

  final String tableMascots = 'mascots';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mascots.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableMascots(id INTEGER PRIMARY KEY AUTOINCREMENT, Especie TEXT, Raza TEXT, Nombre TEXT, Edad INTEGER, Nacimiento TEXT, Padre TEXT, Madre TEXT)");
  }

  Future<void> insert(Mascots mascots) async {
    final db = await instance.database;
    await db.insert(tableMascots, mascots.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Mascots>> getAllMascots() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> mascotsMap = await db.query(tableMascots);

    return List.generate(mascotsMap.length, (i) {
      return Mascots(
        esp: mascotsMap[i]['Especie'],
        raza: mascotsMap[i]['Raza'],
        name: mascotsMap[i]['Nombre'],
        edad: mascotsMap[i]['Edad'],
        fech: mascotsMap[i]['Nacimiento'],
        padre: mascotsMap[i]['Padre'],
        madre: mascotsMap[i]['Madre'],
      );
    });
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableMascots,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
