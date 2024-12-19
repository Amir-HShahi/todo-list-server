import 'package:flutter/cupertino.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/services/database_handler.dart';
import 'package:todo_list_server/services/http_handler.dart';

class TaskViewModel with ChangeNotifier {
  late List<TaskModel> _taskModels = [];

  void addTaskModel(TaskModel taskModel) async {
    TaskModel fetchedModel = await HttpHandler.insertTaskModel(taskModel);
    DatabaseHandler.insertTaskModel(fetchedModel);
    _taskModels.add(fetchedModel);
    notifyListeners();
  }

  List<TaskModel> getTaskModels() {
    return _taskModels;
  }

  void initializeData() async {
    _taskModels = await DatabaseHandler.retrieveTaskModels();
    notifyListeners();
  }

  void deleteTaskModel(TaskModel taskModel) async {
    HttpHandler.deleteTaskModel(taskModel);
    DatabaseHandler.deleteTaskModel(taskModel);
    _taskModels.remove(taskModel);
    notifyListeners();
  }

  void editTaskModel(TaskModel taskModel) async {
    HttpHandler.updateTaskModel(taskModel);
    DatabaseHandler.updateTaskModel(taskModel);
    notifyListeners();
  }
}
