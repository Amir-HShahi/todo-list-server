import 'package:flutter/material.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/view/utility.dart';

import 'components/bottom_floating_button.dart';
import 'components/customized_app_bar.dart';
import 'components/date_dropdown_widget.dart';
import 'components/description_field_widget.dart';
import 'components/task_name_field.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  const EditTaskScreen({super.key, required this.taskModel});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
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
    void editTaskHandler() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizedAppBar(title: "Edit"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomFloatingButton(
          title: "Edited",
          onTap: editTaskHandler,
          iconPath: "assets/edit_icon.svg"),
      body: SizedBox(
        height: scaledHeight(550),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scaledWidth(30)),
            child: Column(
              children: [
                TaskNameField(
                    hintText: widget.taskModel.title,
                    controller: titleController),
                SizedBox(height: scaledHeight(24)),
                DescriptionFieldWidget(
                    hintText: widget.taskModel.description,
                    controller: descriptionController),
                SizedBox(height: scaledHeight(24)),
                DateDropdownWidget(
                    title: "Start Date",
                    selectDateHandler: selectStartDateHandler,
                    hintTime: widget.taskModel.createdAt),
                SizedBox(height: scaledHeight(24)),
                DateDropdownWidget(
                    title: "Start Date",
                    selectDateHandler: selectEndDateHandler,
                    hintTime: widget.taskModel.dueDate),
                SizedBox(height: scaledHeight(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
