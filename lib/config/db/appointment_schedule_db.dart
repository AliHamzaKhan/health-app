


import 'package:sqflite/sqflite.dart';
import '../model/appointment_schedule_model.dart';
import 'package:path/path.dart';

// final db = AppointmentScheduleDB.instance;
// // Create a new appointment schedule
// AppointmentScheduleModel appointment = AppointmentScheduleModel(
//   id: '123',
//   doctorName: 'Dr. John Doe',
//   hospitalName: 'City Hospital',
//   date: '2024-09-25',
//   description: 'Routine check-up',
//   address: '123 Main St, Karachi',
//   notifyMe: true,
// );
// // Insert into database
// await db.insertAppointment(appointment);
// // Retrieve all appointments
// List<AppointmentScheduleModel> appointments = await db.getAllAppointments();
// print(appointments);
// // Update an appointment
// appointment.doctorName = 'Dr. Jane Smith';
// await db.updateAppointment(appointment);
// // Delete an appointment
// await db.deleteAppointment(appointment.id);

class AppointmentScheduleDB {
  static final AppointmentScheduleDB instance = AppointmentScheduleDB._init();

  static Database? _database;

  AppointmentScheduleDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('appointment_schedule.db');
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
    const boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE appointment_schedule (
      id $idType,
      doctorName $textType,
      hospitalName $textType,
      date $textType,
      description $textType,
      address $textType,
      notifyMe $boolType
    )
    ''');
  }

  Future<int> insertAppointment(AppointmentScheduleModel appointment) async {
    final db = await instance.database;
    return await db.insert('appointment_schedule', appointment.toJson());
  }

  Future<List<AppointmentScheduleModel>> getAllAppointments() async {
    final db = await instance.database;

    final result = await db.query('appointment_schedule');

    return result.map((json) => AppointmentScheduleModel.fromJson(json)).toList();
  }

  Future<int> updateAppointment(AppointmentScheduleModel appointment) async {
    final db = await instance.database;

    return db.update(
      'appointment_schedule',
      appointment.toJson(),
      where: 'id = ?',
      whereArgs: [appointment.id],
    );
  }

  Future<int> deleteAppointment(String id) async {
    final db = await instance.database;

    return await db.delete(
      'appointment_schedule',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}