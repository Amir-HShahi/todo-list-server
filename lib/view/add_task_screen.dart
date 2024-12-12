import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/view/components/bottom_floating_button.dart';
import 'package:todo_list_server/view/components/customized_app_bar.dart';
import 'package:todo_list_server/view/components/date_dropdown_widget.dart';
import 'package:todo_list_server/view/components/description_field_widget.dart';
import 'package:todo_list_server/view/components/task_name_field.dart';
import 'package:todo_list_server/view/utility.dart';

import '../viewModel/task_view_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  void selectStartDateHandler(DateTime selected, DateTime hint) {
    startDate = selected;
  }

  void selectEndDateHandler(DateTime selected, DateTime hint) {
    endDate = selected;
  }

  @override
  Widget build(BuildContext context) {
    void addTaskHandler() {
      final taskViewModel = context.read<TaskViewModel>();
      taskViewModel.addTaskModel(TaskModel(
          id: taskViewModel.generateId(),
          title: titleController.text,
          description: descriptionController.text,
          createdAt: startDate,
          dueDate: endDate));
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizedAppBar(title: "Add Task"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomFloatingButton(
          title: "Add",
          onTap: addTaskHandler,
          iconPath: "assets/plus_icon.svg"),
      body: SizedBox(
        height: scaledHeight(550),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scaledWidth(30)),
            child: Column(
              children: [
                TaskNameField(hintText: 'Title', controller: titleController),
                SizedBox(height: scaledHeight(24)),
                DescriptionFieldWidget(
                    hintText: "...", controller: descriptionController),
                SizedBox(height: scaledHeight(24)),
                DateDropdownWidget(
                    title: "Start Date",
                    selectDateHandler: selectStartDateHandler,
                    hintTime: DateTime.now()),
                SizedBox(height: scaledHeight(24)),
                DateDropdownWidget(
                    title: "End Date",
                    selectDateHandler: selectEndDateHandler,
                    hintTime: DateTime.now()),
                SizedBox(height: scaledHeight(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
