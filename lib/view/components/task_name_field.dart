import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_server/view/utility.dart';

class TaskNameField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TaskNameField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaledWidth(330),
      height: scaledHeight(64),
      padding: EdgeInsets.symmetric(
          horizontal: scaledWidth(16), vertical: scaledHeight(14)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(scaledHeight(15))),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff5F33E1).withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Task Name",
              style: GoogleFonts.lexendDeca(
                  fontSize: scaledHeight(8), color: const Color(0xff6E6A7C))),
          SizedBox(
            height: scaledHeight(4),
          ),
          TextField(
            maxLines: 1,
            controller: controller,
            style: GoogleFonts.lexendDeca(
                fontSize: scaledHeight(12), color: const Color(0xff24252C)),
            decoration: InputDecoration.collapsed(
                filled: false,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.lexendDeca(
                    fontSize: scaledHeight(12),
                    color: const Color(0xff6E6A7C))),
          ),
        ],
      ),
    );
  }
}
