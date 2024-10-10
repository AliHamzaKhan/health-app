import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import '../../utils/app_print.dart';
import '../model/sugar_model.dart';

class SugarMonitorDb {
  static final SugarMonitorDb instance = SugarMonitorDb._init();

  static Database? _database;

  SugarMonitorDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('sugar_monitor.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const realType = 'REAL NOT NULL';

    await db.execute('''
    CREATE TABLE sugar_monitor (
      id $idType,
      sugarType $textType,
      dateTime $textType,
      totalSugar $realType
    )
    ''');
  }

  Future<int> insertSugarData(SugarModel sugar) async {
    try {
      sugar.id = Uuid().v4();
      final db = await instance.database;
      return await db.insert('sugar_monitor', sugar.toJson());
    } catch (e) {
      appDebugPrint('Error inserting sugar data: $e');
      return -1;
    }
  }

  Future<List<SugarModel>> getAllSugarData() async {
    final db = await instance.database;

    final result = await db.query('sugar_monitor');

    appDebugPrint('result $result');
    return result.map((json) => SugarModel.fromJson(json)).toList();
  }

  Future<int> updateSugarData(SugarModel sugar) async {
    try {
      final db = await instance.database;

      return db.update(
        'sugar_monitor',
        sugar.toJson(),
        where: 'id = ?',
        whereArgs: [sugar.id],
      );
    } catch (e) {
      appDebugPrint('Error updating sugar data: $e');
      return -1;
    }
  }

  Future<int> deleteSugarData(String id) async {
    try {
      final db = await instance.database;

      return await db.delete(
        'sugar_monitor',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      appDebugPrint('Error deleting sugar data: $e');
      return -1; // Indicate failure
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
