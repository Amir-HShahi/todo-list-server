import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_server/routes.dart';
import 'package:todo_list_server/services/database.dart';
import 'package:todo_list_server/view/introduction.dart';
import 'package:todo_list_server/view/utility.dart';

void main() async {
  await DatabaseHandler.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenData(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Introduction(),
      routes: routes,
    );
  }
}
