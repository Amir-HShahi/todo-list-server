import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_server/routes.dart';
import 'package:todo_list_server/services/database_handler.dart';
import 'package:todo_list_server/view/introduction.dart';
import 'package:todo_list_server/view/utility.dart';
import 'package:todo_list_server/viewModel/task_view_model.dart';

void main() async {
  await DatabaseHandler.initializeDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenData(context);
    final taskViewModel = context.read<TaskViewModel>();
    taskViewModel.initializeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Introduction(),
      routes: routes,
    );
  }
}
