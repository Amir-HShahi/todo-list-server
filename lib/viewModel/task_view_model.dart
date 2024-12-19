import 'package:flutter/cupertino.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/services/database_handler.dart';
import 'package:todo_list_server/services/http_handler.dart';

class TaskViewModel with ChangeNotifier {
  static int _idTracker = 0;
  late List<TaskModel> _taskModels = [];

  void addTaskModel(TaskModel taskModel) {
    HttpHandler.insertTaskModel(taskModel);
    DatabaseHandler.insertTaskModel(taskModel);
    _taskModels.add(taskModel);
    notifyListeners();
  }

  int generateId() {
    return ++_idTracker;
  }

  List<TaskModel> getTaskModels() {
    return _taskModels;
  }

  void initializeData() async {
    _taskModels = await DatabaseHandler.retrieveTaskModels();
    _idTracker = _taskModels.length;
    notifyListeners();
  }

  void deleteTaskModel(TaskModel taskModel) async {
    HttpHandler.deleteTaskModel(taskModel);
    DatabaseHandler.deleteTaskModel(taskModel);
    _taskModels.remove(taskModel);
    notifyListeners();
  }

  void editTaskModel(TaskModel taskModel) async {
    DatabaseHandler.updateTaskModel(taskModel);
    notifyListeners();
  }
}
