import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_server/view/components/bottom_floating_button.dart';
import 'package:todo_list_server/view/components/task_card_widget.dart';
import 'package:todo_list_server/view/utility.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void tapAddTaskHandler() {}

  void tapEditButtonHandler() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomFloatingButton(
          title: "Add Task",
          iconPath: "assets/plus_icon.svg",
          placeIconAtEnd: true,
          onTap: tapAddTaskHandler),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaledWidth(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: scaledHeight(62), width: double.infinity),
                Text("Home",
                    style: GoogleFonts.lexendDeca(
                        fontSize: scaledHeight(19), fontWeight: FontWeight.w800)),
                SizedBox(height: scaledHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: tapEditButtonHandler,
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                const Color(0xff5F33E1))),
                        child: Text("Edit",
                            style: GoogleFonts.lexendDeca(
                                color: Colors.white,
                                fontSize: scaledHeight(12),
                                fontWeight: FontWeight.w800)))
                  ],
                ),
                SizedBox(height: scaledHeight(16)),
                const TaskCardWidget(
                  textColor: Color(0xffF478B8),
                  title: 'To Do list app',
                  date: 'Today',
                ),
                SizedBox(height: scaledHeight(16)),
                const TaskCardWidget(
                  textColor: Color(0xff7BB7EC),
                  title: 'To Do list app',
                  date: 'Today',
                ),
                SizedBox(height: scaledHeight(170))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
