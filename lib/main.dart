import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_server/routes.dart';
import 'package:todo_list_server/services/database_handler.dart';
import 'package:todo_list_server/services/shared_preferences.dart';
import 'package:todo_list_server/view/home_screen.dart';
import 'package:todo_list_server/view/introduction.dart';
import 'package:todo_list_server/view/utility.dart';
import 'package:todo_list_server/viewModel/task_view_model.dart';

void main() async {
  await DatabaseHandler.initializeDatabase();
  final bool isIntroductionDone = await SharedPreference.hasShownIntro();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: MyApp(isIntroductionDone: isIntroductionDone),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isIntroductionDone;
  const MyApp({super.key, required this.isIntroductionDone});

  @override
  Widget build(BuildContext context) {
    initializeScreenData(context);
    final taskViewModel = context.read<TaskViewModel>();
    taskViewModel.initializeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !isIntroductionDone ? const Introduction() : const HomeScreen(),
      routes: routes,
    );
  }
}
