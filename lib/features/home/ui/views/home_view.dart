import 'package:flutter/material.dart';
import 'package:habitect/features/home/ui/views/habits_view.dart';
import 'package:habitect/features/home/ui/views/widgets/custom_floating_action_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/features/home/ui/views/goal_view.dart';
import 'package:habitect/features/home/ui/views/widgets/goal_components.dart';
import '../../../../core/shared/widgets/habit_item.dart';
import '../../../../core/shared/widgets/see_text_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const id = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> userHabits = ["Meditating", "Read Philosophy", "Journaling"];

  // map to track habit completion status
  final Map<String, bool> habitStates = {};

  // User name
  final String name = "Susy";

  @override
  void initState() {
    super.initState();
    for (var habit in userHabits) {
      habitStates[habit] = false;
    }
  }

  double getCompletedPercentage() {
    int totalHabits = userHabits.length;
    int completedHabits = habitStates.values.where((checked) => checked).length;
    return (completedHabits / totalHabits) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FCFCFF'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sun, 1 March 2022',
                style: TextStyle(
                  fontSize: 16.0,
                  color: HexColor('#2F2F2F'),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ), //date
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: HexColor('#2F2F2F'),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$name!',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: HexColor('#3843FF'),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ), // hello, name
              SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                height: 189.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: HexColor('#3843FF'),
                  /*gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors:[
                          Colors.white.withOpacity(0.15),  // Very subtle white at top
                          HexColor('#3843FF').withOpacity(0.05),  // Very subtle blue fade
                          HexColor('#3843FF').withOpacity(0.1),  // Slightly stronger fade
                          Colors.transparent,
                        ],
                        stops: const [0.3, 0.4, 0.4, 0.6],
                      ),
      */
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 14.0,
                      percent: getCompletedPercentage() / 100,
                      center: Text(
                        '${getCompletedPercentage().toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      progressColor: Colors.white,
                      backgroundColor: HexColor('#AFB3ED'),
                      circularStrokeCap: CircularStrokeCap.square,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${habitStates.values.where((checked) => checked).length} of ${userHabits.length} habits\ncompleted today!',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: HexColor('#FFFFFF'),
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.0),

                        //calender flit
                      ],
                    ),
                  ],
                ),
              ), //habit completion container
              //habit completion
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today Habit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                              color: HexColor('2F2F2F'),
                            ),
                          ),
                          SeeTextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HabitsView(),
                                ),
                              );
                            },
                            text: 'See all',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#3843FF'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (context, index) {
                        final habit = userHabits[index];
                        return HabitItem(
                          width: double.infinity,
                          height: 58,
                          background: HexColor('#FBFBFB'),
                          text: userHabits[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#3843FF'),
                          ),
                          isChecked: habitStates[habit] ?? false,
                          onChecked: (bool? checked) {
                            setState(() {
                              habitStates[habit] = checked ?? false;
                            });
                          },
                          iconSize: 20.0,
                          iconColor: HexColor('#666666'),
                          onPressed: () {},
                          borderColor: HexColor(
                            '#3843FF',
                          ).withValues(alpha: 0.1),
                          borderWidth: 0.1,
                          checkboxSize: 30.0,
                          checkColor: Colors.white,
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(height: 10.0),
                      itemCount: userHabits.length,
                    ),

                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Goals",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, GoalView.id);
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: AppColors.lightPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            height: 300,
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  GoalComponents(
                                    label: "Finish 5 books",
                                    linearProgress: AppColors.primaryColor,
                                  ),
                                  SizedBox(height: 15),
                                  GoalComponents(
                                    label: "Sleep before 11 ",
                                    linearProgress: AppColors.primaryColor,
                                  ),
                                  SizedBox(height: 15),
                                  GoalComponents(
                                    label: "Finish my homework ",
                                    linearProgress: AppColors.primaryColor,
                                  ),
                                  SizedBox(height: 15),
                                  GoalComponents(
                                    label: "Go to my faculty ",
                                    linearProgress: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ), //habit items container
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
