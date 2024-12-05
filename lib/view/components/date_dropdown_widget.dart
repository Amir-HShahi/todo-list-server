import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_server/view/utility.dart';

class DateDropdownWidget extends StatefulWidget {
  final String title;
  final DateTime hintTime;
  final Function(DateTime, DateTime) selectDateHandler;
  const DateDropdownWidget(
      {super.key,
      required this.title,
      required this.selectDateHandler,
      required this.hintTime});

  @override
  State<DateDropdownWidget> createState() => _DateDropdownWidgetState();
}

class _DateDropdownWidgetState extends State<DateDropdownWidget> {
  final ExpandableController controller = ExpandableController();
  bool isSelected = false;
  late DateTime selectedTime;
  void expandCardHandler() {
    setState(() {
      controller.expanded = !controller.expanded;
    });
  }

  void selectBirthDateHandler(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      widget.selectDateHandler(selectedDay, focusedDay);
      selectedTime = focusedDay;

      controller.expanded = !controller.expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isSelected) {
      selectedTime = widget.hintTime;
      isSelected = true;
    }
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff5F33E1).withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 5), // changes position of shadow
        ),
      ]),
      child: OutlinedButton(
        onPressed: controller.expanded ? null : expandCardHandler,
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(0),
          side: BorderSide.none,
          backgroundColor: Colors.white,
        ),
        child: ExpandablePanel(
            controller: controller,
            theme: const ExpandableThemeData(
                tapHeaderToExpand: false, hasIcon: false),
            collapsed: const SizedBox(),
            header: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaledWidth(16), vertical: scaledHeight(16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/calendar_icon.svg",
                      height: scaledHeight(16)),
                  SizedBox(width: scaledWidth(12)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          style: GoogleFonts.lexendDeca(
                              fontSize: scaledHeight(8),
                              color: const Color(0xff6E6A7C))),
                      SizedBox(height: scaledHeight(4)),
                      Text(DateFormat('dd MMM, yyyy').format(selectedTime),
                          style: GoogleFonts.lexendDeca(
                              fontSize: scaledHeight(12),
                              color: const Color(0xff24252C)))
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/expand_down_icon.svg",
                      height: scaledHeight(24))
                ],
              ),
            ),
            expanded: Column(
              children: [
                SizedBox(
                  child: TableCalendar(
                    headerVisible: false,
                    focusedDay: selectedTime,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 01, 01),
                    onDaySelected: selectBirthDateHandler,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, DateTime.now()),
                    calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: const Color(0xff5F33E1).withOpacity(0.6),
                            shape: BoxShape.circle),
                        selectedDecoration: const BoxDecoration(
                            color: Color(0xff5F33E1), shape: BoxShape.circle)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
