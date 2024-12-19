import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list_server/model/task_model.dart';

class HttpHandler {
  static const String _ipAddress = '10.0.2.2';
  static const String _port = '666';

  static Future<http.Response> insertTaskModel(TaskModel taskModel) async {
    return http.post(Uri.parse('http://$_ipAddress:$_port/to_do/tasks/'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(taskModel.toJson()));
  }

  static void deleteTaskModel(TaskModel taskModel) async {}

  static void updateTaskModel(TaskModel taskModel) async {}

  static void getTaskModel() async {}

  static FutureOr<List<TaskModel>> retrieveTaskModels() async {
    return [];
  }
}
