import 'package:flutter/material.dart';
import 'package:habitect/features/progress/data/models/goal.dart';
import 'package:habitect/features/progress/ui/views/widgets/goal_calendar.dart';
import 'package:habitect/features/progress/ui/views/widgets/goal_details.dart';
import 'package:habitect/features/progress/ui/views/widgets/month_navigation.dart';
import 'package:table_calendar/table_calendar.dart';

class Goal {
  final String title;
  final String progressText;
  final double progressValue;
  final GoalStatus status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? habitType;
  final int? targetDays;
  final int? completedDays;
  final Map<DateTime, bool>? completedDaysMap;

  Goal({
    required this.title,
    required this.progressText,
    required this.progressValue,
    required this.status,
    this.startDate,
    this.endDate,
    this.habitType,
    this.targetDays,
    this.completedDays,
    this.completedDaysMap,
  });

  int get daysFailed => (targetDays ?? 0) - (completedDays ?? 0);
}

class YourGoalsDetailProcessScreen extends StatefulWidget {
  const YourGoalsDetailProcessScreen({super.key});
  static const id = 'YourGoalsDetailProcessScreen';
  @override
  _YourGoalsDetailProcessScreenState createState() =>
      _YourGoalsDetailProcessScreenState();
}

class _YourGoalsDetailProcessScreenState
    extends State<YourGoalsDetailProcessScreen> {
  late Goal goal;
  DateTime _focusedDay = DateTime.utc(2022, 7, 1);
  DateTime? _selectedDay;
  final Map<DateTime, bool> _completedDays = {};

  final DateTime _firstDay = DateTime.utc(2022, 1, 1);
  final DateTime _lastDay = DateTime.utc(2022, 12, 31);

  @override
  void initState() {
    super.initState();
    // Initialize goal data
    goal = Goal(
      title: "Journaling Everyday",
      progressText: "7 from 7 Days",
      progressValue: 1.0,
      status: GoalStatus.achieved,
      startDate: DateTime.utc(2022, 6, 4),
      endDate: DateTime.utc(2022, 7, 3),
      habitType: "EVERYDAY",
      targetDays: 7,
      completedDays: 7,
      completedDaysMap: {},
    );

    for (int i = 0; i < 7; i++) {
      DateTime day = DateTime.utc(2022, 6, 27).add(Duration(days: i));
      _completedDays[DateTime.utc(day.year, day.month, day.day)] = true;
    }
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Goal: ${goal.title}"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Month Navigation
                  MonthNavigation(
                    startDate: goal.startDate ?? DateTime.utc(2022, 6, 4),
                    endDate: goal.endDate ?? DateTime.utc(2022, 7, 3),
                    focusedDay: _focusedDay,
                    firstDay: _firstDay,
                    lastDay: _lastDay,
                    onPreviousMonth: () {
                      setState(() {
                        DateTime newFocusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month - 1,
                        );
                        if (newFocusedDay.isAfter(_firstDay) ||
                            isSameDay(newFocusedDay, _firstDay)) {
                          _focusedDay = newFocusedDay;
                        }
                      });
                    },
                    onNextMonth: () {
                      setState(() {
                        DateTime newFocusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month + 1,
                        );
                        if (newFocusedDay.isBefore(_lastDay) ||
                            isSameDay(newFocusedDay, _lastDay)) {
                          _focusedDay = newFocusedDay;
                        }
                      });
                    },
                    screenWidth: screenWidth,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Calendar
                  GoalCalendar(
                    focusedDay: _focusedDay,
                    selectedDay: _selectedDay,
                    completedDays: goal.completedDaysMap ?? _completedDays,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Selected day: ${selectedDay.day}/${selectedDay.month}/${selectedDay.year}",
                          ),
                        ),
                      );
                    },
                    screenWidth: screenWidth,
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Goal Details
                  GoalDetails(
                    habitName: "Journaling",
                    target: goal.progressText,
                    daysComplete:
                        "${goal.completedDays ?? 7} from ${goal.targetDays ?? 7} Days",
                    daysFailed: "${goal.daysFailed} Day",
                    habitType: goal.habitType ?? "EVERYDAY",
                    createdOn:
                        "${_formatDate(goal.startDate ?? DateTime.utc(2022, 6, 4))}",
                    status: goal.status,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
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
      "December",
    ];
    return "${months[date.month - 1]} ${date.day} ${date.year}";
  }
}
