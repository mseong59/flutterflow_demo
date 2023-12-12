// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';

class CustomIconCalendarWidget extends StatefulWidget {
  const CustomIconCalendarWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomIconCalendarWidgetState createState() =>
      _CustomIconCalendarWidgetState();
}

class _CustomIconCalendarWidgetState extends State<CustomIconCalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TableCalendar - Basics'),
      // ),
      body: TableCalendar(
        firstDay: DateTime(2021, 1, 1), //kFirstDay,
        lastDay: DateTime(2030, 12, 31), //kLastDay,
        focusedDay: DateTime.now(),
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(DateTime.now(), day);
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),

        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(DateTime.now(), selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              // _selectedDay = selectedDay;
              // _focusedDay = focusedDay;
            });
          }
        },

        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          // _focusedDay = focusedDay;
        },
      ),
    );
  }
}
