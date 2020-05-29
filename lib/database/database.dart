import 'dart:async';
import 'dart:io';

import 'package:inventory/models/ContainerModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "inventory.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE ContainerModel ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "description TEXT"
          ")");
    });
  }

  newContainerModel(ContainerModel newContainerModel) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM ContainerModel");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into ContainerModel (id,name,description)"
        " VALUES (?,?,?,?)",
        [id, newContainerModel.name, newContainerModel.description]);
    return raw;
  }


  updateContainerModel(ContainerModel newContainerModel) async {
    final db = await database;
    var res = await db.update("ContainerModel", newContainerModel.toMap(),
        where: "id = ?", whereArgs: [newContainerModel.id]);
    return res;
  }

  getContainerModel(int id) async {
    final db = await database;
    var res = await db.query("ContainerModel", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ContainerModel.fromMap(res.first) : null;
  }

  Future<List<ContainerModel>> getBlockedContainerModels() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM ContainerModel WHERE blocked=1");
    var res = await db.query("ContainerModel", where: "blocked = ? ", whereArgs: [1]);

    List<ContainerModel> list =
        res.isNotEmpty ? res.map((c) => ContainerModel.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<ContainerModel>> getAllContainerModels() async {
    final db = await database;
    var res = await db.query("ContainerModel");
    List<ContainerModel> list =
        res.isNotEmpty ? res.map((c) => ContainerModel.fromMap(c)).toList() : [];
    return list;
  }

  deleteContainerModel(int id) async {
    final db = await database;
    return db.delete("ContainerModel", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from ContainerModel");
  }
}