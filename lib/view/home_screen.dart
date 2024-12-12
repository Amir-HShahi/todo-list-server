import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/view/components/bottom_floating_button.dart';
import 'package:todo_list_server/view/components/customized_app_bar.dart';
import 'package:todo_list_server/view/utility.dart';

import '../viewModel/task_view_model.dart';
import 'components/task_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final taskViewModel = context.watch<TaskViewModel>();
    void tapEditButtonHandler() {
      setState(() {
        isEditing = !isEditing;
      });
    }

    void tapAddTaskHandler() {
      Navigator.pushNamed(context, "/AddTask");
    }

    void tapDoneHandler() {
      setState(() {
        isEditing = !isEditing;
      });
    }

    return Scaffold(
      appBar: CustomizedAppBar(title: isEditing ? "Edit" : "Home"),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomFloatingButton(
          title: isEditing ? "Done" : "Add Task",
          iconPath: isEditing ? "assets/empty.svg" : "assets/plus_icon.svg",
          placeIconAtEnd: true,
          onTap: isEditing ? tapDoneHandler : tapAddTaskHandler),
      body: SafeArea(
        child: Container(
          height: scaledHeight(550),
          padding: EdgeInsets.symmetric(horizontal: scaledWidth(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 150),
                      opacity: isEditing ? 0 : 1,
                      child: TextButton(
                          onPressed: tapEditButtonHandler,
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xff5F33E1))),
                          child: Text("Edit",
                              style: GoogleFonts.lexendDeca(
                                  color: Colors.white,
                                  fontSize: scaledHeight(12),
                                  fontWeight: FontWeight.w800))),
                    )
                  ],
                ),
                SizedBox(height: scaledHeight(16)),
                for (TaskModel model in taskViewModel.getTaskModels())
                  Column(
                    children: [
                      TaskCardWidget(
                        textColor: const Color(0xffF478B8),
                        title: model.title,
                        date: model.description,
                        isEditing: isEditing,
                      ),
                      SizedBox(height: scaledHeight(16)),
                    ],
                  ),
                // SizedBox(height: scaledHeight(170))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
