import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility.dart';

class CustomizedAppBar extends PreferredSize {
  final String title;
  CustomizedAppBar({super.key, required this.title})
      : super(
            preferredSize: Size(double.infinity, scaledHeight(110)),
            child: _AppBar(title));
}

class _AppBar extends StatelessWidget {
  final String title;
  const _AppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: scaledHeight(62), width: double.infinity),
          Text(title,
              style: GoogleFonts.lexendDeca(
                  fontSize: scaledHeight(19), fontWeight: FontWeight.w800)),
          // SizedBox(height: scaledHeight(24)),
        ],
      ),
    );
  }
}
