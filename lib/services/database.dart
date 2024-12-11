import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/task_model.dart';

class DatabaseHandler {
  static late Database _db;
  static const String _databaseName = 'tasks_database.db';

  static FutureOr<void> _onCreateHandler(Database db, int version) {
    return db.execute(
      'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt DATETIME, dueDate DATETIME, isCompleted BOOLEAN)',
    );
  }

  static Future<Database> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(join(await getDatabasesPath(), _databaseName),
        onCreate: _onCreateHandler, version: 1);
    return _db;
  }

  static void insertTaskModel(TaskModel taskModel) async {
    _db.insert('tasks', taskModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static FutureOr<List<TaskModel>> retrieveTaskModels() async {
    final List<Map<String, dynamic>> taskModelMaps = await _db.query('tasks');
    return [
      for (Map<String, dynamic> map in taskModelMaps)
        jsonDecode(map.toString()),
    ];
  }

  static void updateTaskModel(TaskModel taskModel) async {
    await _db.update('tasks', taskModel.toJson(),
        where: 'id = ?', whereArgs: [taskModel.id]);
  }
}
