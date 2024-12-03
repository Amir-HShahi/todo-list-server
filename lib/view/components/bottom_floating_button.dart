import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_server/view/utility.dart';

class BottomFloatingButton extends StatelessWidget {
  final String title;
  final String? iconPath;
  final bool placeIconAtEnd;
  final Function() onTap;
  const BottomFloatingButton(
      {super.key,
      required this.title,
      this.iconPath,
      this.placeIconAtEnd = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: scaledWidth(330),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xff5F33E1).withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 12,
            offset: const Offset(0, 7), // changes position of shadow
          ),
        ]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              "assets/button.svg",
              width: scaledWidth(330),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Let’s Start",
                    style: GoogleFonts.lexendDeca(
                      fontSize: scaledHeight(19),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
                if (iconPath != null && !placeIconAtEnd)
                  Row(
                    children: [
                      SizedBox(width: scaledWidth(7)),
                      SvgPicture.asset(iconPath!, height: scaledHeight(24)),
                    ],
                  )
              ],
            ),
            if (iconPath != null && placeIconAtEnd)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(iconPath!, height: scaledHeight(24)),
                  SizedBox(width: scaledWidth(22))
                ],
              )
          ],
        ),
      ),
    );
  }
}
