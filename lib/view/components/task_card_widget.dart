import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_server/model/task_model.dart';
import 'package:todo_list_server/view/edit_task_screen.dart';
import 'package:todo_list_server/view/utility.dart';

import '../../viewModel/task_view_model.dart';

class TaskCardWidget extends StatefulWidget {
  final TaskModel taskModel;
  final Color textColor;
  final bool isEditing;
  const TaskCardWidget(
      {super.key,
      required this.textColor,
      required this.isEditing,
      required this.taskModel});

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  void editTaskHandler() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditTaskScreen(taskModel: widget.taskModel)));
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = context.read<TaskViewModel>();

    void deleteTaskHandler() {
      taskViewModel.deleteTaskModel(widget.taskModel);
    }

    void toggleTaskCondition() {
      setState(() {
        widget.taskModel.isCompleted = !widget.taskModel.isCompleted;
        taskViewModel.editTaskModel(widget.taskModel);
      });
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        OutlinedButton(
          onPressed: toggleTaskCondition,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.textColor.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              side: BorderSide.none,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: scaledWidth(12)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: scaledHeight(12)),
                  SvgPicture.asset("assets/bag_icon.svg",
                      height: scaledHeight(14)),
                  SizedBox(height: scaledHeight(4)),
                  Text(widget.taskModel.title,
                      style: GoogleFonts.lexendDeca(
                          color: widget.textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w800)),
                  Text(widget.taskModel.description,
                      style: GoogleFonts.lexendDeca(
                        color: widget.textColor.withOpacity(0.5),
                        fontSize: 8,
                      )),
                ],
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  !widget.isEditing
                      ? Row(
                          children: [
                            Container(
                              height: scaledHeight(25),
                              width: scaledHeight(25),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: widget.taskModel.isCompleted
                                  ? Image(
                                      image: const AssetImage(
                                          "assets/done_task.png"),
                                      color: widget.textColor)
                                  : const Text(""),
                            ),
                            SizedBox(
                                width: scaledWidth(20),
                                height: scaledHeight(64)),
                          ],
                        )
                      : const SizedBox(),
                  Row(
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: widget.isEditing ? 1 : 0,
                        child: InkWell(
                          onTap: widget.isEditing ? editTaskHandler : null,
                          child: Image(
                              image:
                                  const AssetImage("assets/task_edit_icon.png"),
                              color: widget.textColor,
                              height: scaledHeight(24)),
                        ),
                      ),
                      SizedBox(width: scaledWidth(16)),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: widget.isEditing ? 1 : 0,
                        child: InkWell(
                          onTap: widget.isEditing ? deleteTaskHandler : null,
                          child: Container(
                            width: scaledWidth(54),
                            height: scaledHeight(64),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(14),
                                  bottomRight: Radius.circular(14)),
                            ),
                            child: SvgPicture.asset("assets/trash_icon.svg",
                                height: scaledHeight(18)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
            height: scaledHeight(50),
            width: 2,
            decoration: BoxDecoration(
                color: widget.textColor,
                borderRadius: const BorderRadius.all(Radius.circular(10))))
      ],
    );
  }
}
