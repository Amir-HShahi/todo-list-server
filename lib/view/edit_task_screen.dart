import 'package:flutter/material.dart';
import 'package:todo_list_server/view/utility.dart';

import 'components/bottom_floating_button.dart';
import 'components/customized_app_bar.dart';
import 'components/date_dropdown_widget.dart';
import 'components/description_field_widget.dart';
import 'components/task_name_field.dart';

class EditTaskScreen extends StatelessWidget {
  EditTaskScreen({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addTaskHandler() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizedAppBar(title: "Edit"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomFloatingButton(
          title: "Edited",
          onTap: addTaskHandler,
          iconPath: "assets/edit_icon.svg"),
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
