import 'package:flutter/material.dart';

class MonthNavigation extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime focusedDay;
  final DateTime firstDay;
  final DateTime lastDay;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final double screenWidth;

  const MonthNavigation({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.focusedDay,
    required this.firstDay,
    required this.lastDay,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    DateTime firstMonth = DateTime(firstDay.year, firstDay.month);
    DateTime lastMonth = DateTime(lastDay.year, lastDay.month);
    DateTime currentMonth = DateTime(focusedDay.year, focusedDay.month);

    bool canGoToPreviousMonth = currentMonth.isAfter(firstMonth);
    bool canGoToNextMonth = currentMonth.isBefore(lastMonth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${_formatDate(startDate)}",
          style: TextStyle(
            color: Colors.grey,
            fontSize: screenWidth * 0.035,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: canGoToPreviousMonth ? onPreviousMonth : null,
              icon: Icon(
                Icons.arrow_left,
                color: canGoToPreviousMonth ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              _getMonthName(focusedDay.month),
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            IconButton(
              onPressed: canGoToNextMonth ? onNextMonth : null,
              icon: Icon(
                Icons.arrow_right,
                color: canGoToNextMonth ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
        Text(
          "${_formatDate(endDate)}",
          style: TextStyle(
            color: Colors.grey,
            fontSize: screenWidth * 0.035,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return "${_getMonthName(date.month)} ${date.day} ${date.year}";
  }

  String _getMonthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }
}