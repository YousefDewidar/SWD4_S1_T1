
class Goal {
  final String title;
  final String progressText;
  final double progressValue;
  final GoalStatus status;

  Goal({
    required this.title,
    required this.progressText,
    required this.progressValue,
    required this.status,
  });
}

enum GoalStatus { achieved, notAchieved }
