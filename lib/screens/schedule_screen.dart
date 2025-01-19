import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../domain/exam.dart';
import '../services/exam_service.dart';
import 'calendar_screen.dart';
import 'maps_screen.dart';


class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}
class _ScheduleScreenState extends State<ScheduleScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final ExamService _examService = ExamService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Scheduler'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              _showAddEventDialog(selectedDay);
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          if (_selectedDay != null)
            Expanded(
              child: ListView.builder(
                itemCount: _examService.exams
                    .where((exam) => isSameDay(exam.date, _selectedDay))
                    .length,
                itemBuilder: (context, index) {
                  final exam = _examService.exams
                      .where((exam) => isSameDay(exam.date, _selectedDay))
                      .toList()[index];
                  return ListTile(
                    title: Text(exam.location),
                    subtitle: Text('${exam.date} at ${exam.time}'),
                  );
                },
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarScreen(),
                    ),
                  );
                },
                child: Text('Go to Calendar'),
              ),
              ElevatedButton(
                onPressed: _showMap,
                child: Text('Go to Map'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddEventDialog(DateTime date) {
    final TextEditingController locationController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Exam'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: 'Time'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final location = locationController.text;
              final time = timeController.text;

              if (location.isNotEmpty && time.isNotEmpty) {
                setState(() {
                  _examService.addExam(
                    Exam(date: date, time: time, location: location),
                  );
                });
              }

              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showMap() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          position: position,
          exams: _examService.exams,
        ),
      ),
    );
  }
}