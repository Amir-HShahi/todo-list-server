import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/task_model.dart';

class DatabaseHandler {
  static late Database _db;
  static const String _databaseName = 'tasks_database.db';

  static FutureOr<void> _onCreateHandler(Database db, int version) {
    return db.execute(
      'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT, start_date DATETIME, due_date DATETIME, is_completed BOOLEAN)',
    );
  }

  static Future<Database> initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(join(await getDatabasesPath(), _databaseName),
        onCreate: _onCreateHandler, version: 1);
    return _db;
  }

  static void insertTaskModel(TaskModel taskModel) async {
    var taskModelMap = taskModel.toJson();
    taskModelMap['is_completed'] = taskModelMap['is_completed'] ? 1 : 0;
    _db.insert('tasks', taskModelMap,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static FutureOr<List<TaskModel>> retrieveTaskModels() async {
    final List<Map<String, dynamic>> taskModelMaps = await _db.query('tasks');
    return [
      for (Map<String, dynamic> map in taskModelMaps)
        TaskModel(
            id: map['id'],
            title: map['title'],
            description: map['description'],
            startDate: DateTime.parse(map['start_date']),
            dueDate: DateTime.parse(map['due_date']),
            isCompleted: map['is_completed'] == 1),
    ];
  }

  static void updateTaskModel(TaskModel taskModel) async {
    await _db.update('tasks', taskModel.toJson(),
        where: 'id = ?', whereArgs: [taskModel.id]);
  }

  static void deleteTaskModel(TaskModel taskModel) async {
    await _db.delete('tasks', where: 'id = ?', whereArgs: [taskModel.id]);
  }
}
