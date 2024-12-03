import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_server/view/components/bottom_floating_button.dart';
import 'package:todo_list_server/view/utility.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    void tapStartButtonHandler() {
      Navigator.pushNamed(context, "/home");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Image(
              image: AssetImage("assets/introduction_image.jpg"),
              width: double.infinity),
          Column(
            children: [
              SizedBox(height: scaledHeight(560)),
              Text(
                "To-Do List\nTask Management",
                textAlign: TextAlign.center,
                style: GoogleFonts.lexendDeca(
                    fontSize: scaledHeight(24),
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff5F33E1)),
              ),
              SizedBox(height: scaledHeight(72)),
              BottomFloatingButton(
                  title: "Let’s Start",
                  iconPath: "assets/arrow_left.svg",
                  placeIconAtEnd: true,
                  onTap: tapStartButtonHandler)
            ],
          )
        ],
      )),
    );
  }
}
