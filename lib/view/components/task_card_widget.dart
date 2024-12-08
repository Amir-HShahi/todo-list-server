import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_server/view/utility.dart';

class TaskCardWidget extends StatefulWidget {
  final String title;
  final String date;
  final Color textColor;
  const TaskCardWidget(
      {super.key,
      required this.textColor,
      required this.title,
      required this.date});

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  bool isTaskDone = false;

  void toggleTaskCondition() {
    setState(() {
      isTaskDone = !isTaskDone;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  Text(widget.title,
                      style: GoogleFonts.lexendDeca(
                          color: widget.textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w800)),
                  Text(widget.date,
                      style: GoogleFonts.lexendDeca(
                        color: widget.textColor.withOpacity(0.5),
                        fontSize: 8,
                      )),
                ],
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.only(top: scaledHeight(19.5)),
                height: scaledHeight(25),
                width: scaledHeight(25),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: isTaskDone
                    ? Image(
                        image: const AssetImage("assets/done_task.png"),
                        color: widget.textColor)
                    : const Text(""),
              ),
              SizedBox(width: scaledWidth(20), height: scaledHeight(64)),
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
