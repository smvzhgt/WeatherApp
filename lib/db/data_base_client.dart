import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../scenes/location_search/data/models/location_search_model.dart';

class DataBaseClient {
  static final DataBaseClient instance = DataBaseClient._init();

  static Database? _database;
  DataBaseClient._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("forecast.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const integerType = "INTEGER NOT NULL";
    const textType = "TEXT NOT NULL";
    const boolType = "BOOLEAN NOT NULL";

    const sql = '''
      CREATE TABLE ${LocationSearchFields.tableName} (
        ${LocationSearchFields.id} $idType,
        ${LocationSearchFields.title} $textType,
        ${LocationSearchFields.locationType} $textType,
        ${LocationSearchFields.woeid} $integerType,
        ${LocationSearchFields.isFavorite} $boolType
      )
    ''';
    await db.execute(sql);
  }

  // CREATE
  Future<LocationSearchModel> create(LocationSearchModel model) async {
    final db = await instance.database;
    final id = await db.insert(LocationSearchFields.tableName, model.toJson());
    return model.copy(id: id);
  }

  Future<LocationSearchModel?> read(int woeid) async {
    final db = await instance.database;
    final maps = await db.query(
      LocationSearchFields.tableName,
      columns: LocationSearchFields.values,
      where: "${LocationSearchFields.woeid} = ?",
      whereArgs: [woeid],
    );

    // TODO: add exception if maps is empty
    if (maps.isNotEmpty) {
      return LocationSearchModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<LocationSearchModel>> readAll() async {
    final db = await instance.database;
    const orderBy = "${LocationSearchFields.title} ASC";
    final result =
        await db.query(LocationSearchFields.tableName, orderBy: orderBy);
    return result.map((json) => LocationSearchModel.fromJson(json)).toList();
  }

  Future<int> update(LocationSearchModel model) async {
    final db = await instance.database;
    return db.update(
      LocationSearchFields.tableName,
      model.toJson(),
      where: "${LocationSearchFields.woeid} = ?",
      whereArgs: [model.woeid],
    );
  }

  Future<int> delete(int woeid) async {
    final db = await instance.database;
    return db.delete(
      LocationSearchFields.tableName,
      where: "${LocationSearchFields.woeid} = ?",
      whereArgs: [woeid],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
