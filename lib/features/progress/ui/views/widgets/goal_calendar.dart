import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class GoalCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Map<DateTime, bool> completedDays;
  final Function(DateTime, DateTime) onDaySelected;
  final double screenWidth;

  const GoalCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.completedDays,
    required this.onDaySelected,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2022, 1, 1),
      lastDay: DateTime.utc(2022, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      onDaySelected: onDaySelected,
      calendarFormat: CalendarFormat.month,
      headerVisible: false,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        todayDecoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        selectedDecoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        defaultDecoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        weekendDecoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        cellMargin: EdgeInsets.all(screenWidth * 0.01),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.035,
        ),
        weekendStyle: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.035,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          bool isCompleted =
              completedDays[DateTime.utc(day.year, day.month, day.day)] ??
                  false;
          return Container(
            margin: EdgeInsets.all(screenWidth * 0.01),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.green : null,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: isCompleted ? Colors.white : Colors.black,
                fontSize: screenWidth * 0.04,
              ),
            ),
          );
        },
      ),
    );
  }
}