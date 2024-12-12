import 'package:flutter/cupertino.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/services/database_handler.dart';

class TaskViewModel with ChangeNotifier {
  late List<TaskModel> _taskModels = [];

  void addTaskModel(TaskModel taskModel) {
    DatabaseHandler.insertTaskModel(taskModel);
    _taskModels.add(taskModel);
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
    DatabaseHandler.deleteTaskModel(taskModel);
    notifyListeners();
  }

  void editTaskModel(TaskModel taskModel) async {
    DatabaseHandler.updateTaskModel(taskModel);
    notifyListeners();
  }
}
