


import 'package:health_app/utils/app_print.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/medicine_schedule_model.dart';

// final db = MedicineScheduleDB.instance;
// MedicineScheduleModel medicine = MedicineScheduleModel(
//   notifyMe: true,
//   medicineName: 'Aspirin',
//   timing: ['08:00 AM', '08:00 PM'],
//   description: 'Take after food',
// );
// await db.insertMedicineSchedule(medicine);
// // Retrieve all schedules
// List<MedicineScheduleModel> schedules = await db.getAllMedicineSchedules();
// print(schedules);
// // Update a schedule
// medicine.medicineName = 'Ibuprofen';
// await db.updateMedicineSchedule(medicine);
// // Delete a schedule
// await db.deleteMedicineSchedule(medicine.id!);

class MedicineScheduleDB {
  static final MedicineScheduleDB instance = MedicineScheduleDB._init();

  static Database? _database;

  MedicineScheduleDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('medicine_schedule.db');
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
    const idType = 'TEXT PRIMARY KEY';  // Using UUID, which is a TEXT type
    const textType = 'TEXT NOT NULL';
    const boolType = 'INTEGER NOT NULL'; // Store booleans as INTEGER (0 or 1)

    await db.execute('''
    CREATE TABLE medicine_schedule (
      id $idType,
      notifyMe $boolType,
      medicineName $textType,
      timing $textType,
      description $textType
    )
    ''');
  }

  Future<int> insertMedicineSchedule(MedicineScheduleModel medicine) async {
    final db = await instance.database;
    return await db.insert('medicine_schedule', medicine.toJson());
  }

  Future<List<MedicineScheduleModel>> getAllMedicineSchedules() async {
    final db = await instance.database;

    final result = await db.query('medicine_schedule');

    appDebugPrint('result $result');
    return result.map((json) => MedicineScheduleModel.fromJson(json)).toList();
  }

  Future<int> updateMedicineSchedule(MedicineScheduleModel medicine) async {
    final db = await instance.database;

    return db.update(
      'medicine_schedule',
      medicine.toJson(),
      where: 'id = ?',
      whereArgs: [medicine.id],
    );
  }

  Future<int> deleteMedicineSchedule(String id) async {
    final db = await instance.database;

    return await db.delete(
      'medicine_schedule',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}