import 'package:flutter/material.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/services/database.dart';
import 'package:todo_list_server/view/components/bottom_floating_button.dart';
import 'package:todo_list_server/view/components/customized_app_bar.dart';
import 'package:todo_list_server/view/components/date_dropdown_widget.dart';
import 'package:todo_list_server/view/components/description_field_widget.dart';
import 'package:todo_list_server/view/components/task_name_field.dart';
import 'package:todo_list_server/view/utility.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addTaskHandler() {
      DatabaseHandler.insertTaskModel(TaskModel(
          id: 1,
          title: 'title',
          description: 'description',
          createdAt: DateTime.now(),
          dueDate: DateTime.now()));
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
      body: SingleChildScrollView(
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
                  selectDateHandler: (DateTime gg, DateTime jj) {},
                  hintTime: DateTime.now()),
              SizedBox(height: scaledHeight(24)),
              DateDropdownWidget(
                  title: "Start Date",
                  selectDateHandler: (DateTime gg, DateTime jj) {},
                  hintTime: DateTime.now()),
              SizedBox(height: scaledHeight(24)),
            ],
          ),
        ),
      ),
    );
  }
}
