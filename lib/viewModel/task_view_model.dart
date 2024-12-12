import 'package:flutter/cupertino.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/services/database_handler.dart';

class TaskViewModel with ChangeNotifier {
  List<TaskModel> taskModels = [];

  Future<void> addTaskModel(TaskModel taskModel) async {
    DatabaseHandler.insertTaskModel(taskModel);
    taskModels.add(taskModel);
    notifyListeners();
  }
}