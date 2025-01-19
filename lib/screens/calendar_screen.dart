import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Selected Day = "+today.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
                rowHeight: 43,
                headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day)=> isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 01, 01),
                lastDay: DateTime.utc(2030, 01, 01),
                onDaySelected: _onDaySelected,
            ),
          ),
        ],
      ),
    );
  }
}
