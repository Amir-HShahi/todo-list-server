 import 'package:flutter/cupertino.dart';
import 'package:todo_list_server/view/add_task_screen.dart';
import 'package:todo_list_server/view/edit_task_screen.dart';
import 'package:todo_list_server/view/home_screen.dart';

Map<String, WidgetBuilder> routes = {
  "/home" : (context) => const HomeScreen(),
  "/AddTask" : (context) => AddTaskScreen(),
};
