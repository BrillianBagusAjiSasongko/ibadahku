// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021),
      lastDay: DateTime.now().add(const Duration(days: 365)),
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false, // Menghilangkan tombol format
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          final isToday = isSameDay(DateTime.now(), date);
          final isSunday = date.weekday == DateTime.sunday;
          final isCurrentMonth = date.month == _focusedDay.month;

          TextStyle dayStyle = TextStyle(
            fontWeight: FontWeight.bold,
            color: isSameDay(_selectedDay, date) ? Colors.white : null,
          );

          if (!isCurrentMonth) {
            dayStyle = dayStyle.copyWith(color: Colors.grey);
          }

          if (isSunday) {
            dayStyle = dayStyle.copyWith(color: Colors.red);
          }

          if (isToday && isCurrentMonth) {
            dayStyle = dayStyle.copyWith(color: Colors.blue);
          }

          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isSameDay(_selectedDay, date) ? Colors.blue : null,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: dayStyle,
              ),
            ),
          );
        },
      ),
    );
  }
}
